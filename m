Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC74B587
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 09:36:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3895991E;
	Sun, 28 Apr 2019 09:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3895991E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556437008;
	bh=/1CRmeedQ3cXGsU8sqvkMwRXZiR4yLD2qcLQC+j48cw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gmmrOLpWlAjgx7eeC9QZsU3gVvaXAc5KguVyID+q6RcPUJP5xPtZ7klN4n9uLeTwO
	 +WXxp9qfqFnbSGq2ysJQ6yt41tutehrN3sYEzDNIG93U5XrKEHfLIJgBalObYolTt+
	 fZjE6Y3zj/Jg1lwAIl7f2dNQ+U4U/oljjqBpoHOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE32F89739;
	Sun, 28 Apr 2019 09:30:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 896D2F896DB; Sat, 27 Apr 2019 21:40:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AABBDF80C0D
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 21:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AABBDF80C0D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RGgrYEnf"
Received: by mail-wr1-x444.google.com with SMTP id a9so9358229wrp.6
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 12:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=fKR+2+8WBNjRQO8k76MeFd4PJddg9TDvAb+H1+9qQ90=;
 b=RGgrYEnfRUcmn/XyJlvcEsio5C4VLyuqVbMNUvSiUxTYPSJFOAdtzxrpBTxO/hUq07
 XM2c7+28aXqoiPhIR7atNCoYPILw0Nx8R087q8RzFORhzRu/0d9s7HVwKq2g7Ck4O7k9
 S5Rq0ekPhNy6JK52Qb/wHutFaGdg0VBBxGwJagTjxR6KrLxvgKiuqJDsLNFZhNKWxXVs
 PDpjuKKn6gZeWQOrFjWf58kMKVheHKDsmD885FEfWYdZnUE+0jJgotg29SjF4x0OFr9M
 9B89bjoNPOS9TgFj1kxOd0oTBF5QomXN3hAosNZvY7ikgKIUWAdUuSXtqjH0i3RWfjY0
 UHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=fKR+2+8WBNjRQO8k76MeFd4PJddg9TDvAb+H1+9qQ90=;
 b=PvSscTQPQB41I1y4ilA3BZiG0sTgR24xIejUeJ88Kt+M2Ia8tT5spWZLREdLs3U1BC
 bqTluTYYQSiD/9tqK3v1Jy9c5fHsZDTntsaZBE0kw+xlJrje63zifBTuvRTKtdT7QRNX
 GGOc9FV3IrIKwj452bI7zvX5dDAL/Pl2qibA8CEx40mmw7XonS1HA/FT6LmLEtg5qSVp
 gAPe8hHPZBq0LtWDhUQpuw4fNVzbRuDvPH2jkncGq2D74FPhh71taYQUNr2exLrNU+w8
 pldqpL4Tu3kEASMOyFeCambfkS+I6zjjPdj4XmILcGvmH2yXc4c2P7FWmaPlGwl3w4qP
 G28w==
X-Gm-Message-State: APjAAAWDXZVrU/04SUAz3IDGcHPM7pD0Yq+ABV4awF7iTLCU2DmrLQkA
 OqgYQ/bmGoPEJnw4HacNDTE=
X-Google-Smtp-Source: APXvYqzu6mAkqViDeimdaKTDzKDyQgLujzASfjuiVNytxBmOrCsKng/3awOUpIBTkk2McR8PqMVgQQ==
X-Received: by 2002:a5d:4a83:: with SMTP id o3mr17138355wrq.90.1556394019754; 
 Sat, 27 Apr 2019 12:40:19 -0700 (PDT)
Received: from localhost.localdomain (p5DCFF0C6.dip0.t-ipconnect.de.
 [93.207.240.198])
 by smtp.gmail.com with ESMTPSA id d18sm11099284wrx.56.2019.04.27.12.40.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Apr 2019 12:40:18 -0700 (PDT)
From: Saravanan Sekar <sravanhome@gmail.com>
To: sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Date: Sat, 27 Apr 2019 21:40:05 +0200
Message-Id: <20190427194005.7308-1-sravanhome@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 28 Apr 2019 09:30:26 +0200
Subject: [alsa-devel] [PATCH] ASoC: tlv320aic3x: Add support for high power
	analog output
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support to power and output level control for the analog high power
output drivers HPOUT and HPCOM.

Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
---
 sound/soc/codecs/tlv320aic3x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index 516d17cb2182..d4bafac802eb 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -419,6 +419,12 @@ static const struct snd_kcontrol_new aic3x_snd_controls[] = {
 	/* Pop reduction */
 	SOC_ENUM("Output Driver Power-On time", aic3x_poweron_time_enum),
 	SOC_ENUM("Output Driver Ramp-up step", aic3x_rampup_step_enum),
+
+	/* Analog HPOUT, HPCOM power and output level controls */
+	SOC_DOUBLE_R("Analog output power control", HPROUT_CTRL,
+			HPRCOM_CTRL, 0, 1, 0),
+	SOC_DOUBLE_R("Analog output level control", HPROUT_CTRL,
+			HPRCOM_CTRL, 4, 9, 0),
 };
 
 /* For other than tlv320aic3104 */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
