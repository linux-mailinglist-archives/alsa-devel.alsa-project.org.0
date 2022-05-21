Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D1552F9FC
	for <lists+alsa-devel@lfdr.de>; Sat, 21 May 2022 10:21:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31D6F16FC;
	Sat, 21 May 2022 10:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31D6F16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653121293;
	bh=txiXFw7OcZoaqUKOMhsl9+Cc3qEP14SyVRsH/3op+4M=;
	h=Date:From:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SNc1UvdzF1HpPwmg9D/MR89Zx8pWdrMogyvsA3v0L4Um7v9NLB32VLyxu8xNVYhan
	 4N6+qCPk1MdE8BbpNGnQf5DzWONzUo3ELP73UeaBZkskDPgZbtcSi7aPFk4Q0snvO4
	 swSAqXrwVpvdVybdUyaeO+QW/ycTrJ/6rAAvnc+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62313F80519;
	Sat, 21 May 2022 10:20:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A19F3F8015B; Sat, 21 May 2022 06:45:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5312F80105
 for <alsa-devel@alsa-project.org>; Sat, 21 May 2022 06:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5312F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TCupcPI0"
Received: by mail-oi1-x22a.google.com with SMTP id q8so12041436oif.13
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 21:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:from
 :subject:to; bh=h/ADGSuwyK7mHd5Tv+8CQq52suYoS5FcCwkMigzvS6M=;
 b=TCupcPI0VYF14n9F7cxO4t5yo84Ko8w0yyqtlAjA1SIzqGbYwhp/m9dCTVuOmd/Nc/
 JPMzayM9doHhYqWIyADf1QIrsrb5GHCZcIcDlyZzz6KlXIed73QAeRyCMKpVqEKHzpsc
 hTFtYlBgkNQjVQbTvGauDQM3n6luQSnghO8zlHSBtbUnUubx41SH03C/gkNLbYSWRmHs
 QOZCXlwAVSZ0xt7oZKPMx5KL6U+lpXwii0uV99kKLFgXKIkRcvj0Ix/VB7k25o3rCNb2
 WbKBHTR6nXmtMH+TIQSoe75QPIVNPLIgJqN+SR9Uih9NL9guP7JJnoxWfW8gi2HZlvh/
 YZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:from:subject:to;
 bh=h/ADGSuwyK7mHd5Tv+8CQq52suYoS5FcCwkMigzvS6M=;
 b=oaaepNFkmq1YZQyJ3vWAUVwQsAuTQKN/QE11XKwcdhYEyuHd7PUZK3KmQ76ri8DHkR
 3KRfU7vEX/XvzbqTwPg0g1NUvyl229f5jDq82tlyCgu+NFKw6zlDeR9l0kQci8EohQix
 gHFShp5yIr9b2hoRPZXOB1vRx8x7pX5tyNlqrP9U487pfGMkwkUypkVJ1SArBhkD/+ta
 SZkce7WEmeCogilgPnbNEGyOjXRjQ0q+TbPRqgqpGI0cue8Wh0qhIhEuJHSYpDDoyWl9
 qNwEWDo74k9vpKDv7XoM+7xAOocrkF7eUVOQOy1IzlHObG246Vz09AvfjwyXV7HO8Nu5
 gG5w==
X-Gm-Message-State: AOAM533HxZ6ZQU5AnUxZLVNe9OfDRvXgh8CD9AkvYnwuS8QiC38hpEUY
 +FkKA4Z39WSDEwQugSJ3rg8HsVeUf9MT5w==
X-Google-Smtp-Source: ABdhPJxpVKatC1xG4l9WzhjjiulRQApJVyj7gWbNI9JTgy9WCBd/P/+9TY/B+Gr7jGJdTxR5eOBT4w==
X-Received: by 2002:a05:6808:220e:b0:328:a2a1:333 with SMTP id
 bd14-20020a056808220e00b00328a2a10333mr7260294oib.22.1653108317224; 
 Fri, 20 May 2022 21:45:17 -0700 (PDT)
Received: from [192.168.1.97] ([47.189.58.205])
 by smtp.gmail.com with ESMTPSA id
 w4-20020acadf04000000b00328b3d8a80fsm1921717oig.50.2022.05.20.21.45.16
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 21:45:16 -0700 (PDT)
Message-ID: <cae7d1a4-8bd9-7dfe-7427-db7e766f7272@gmail.com>
Date: Fri, 20 May 2022 23:45:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
From: Edward Matijevic <motolav@gmail.com>
Subject: [PATCH] ALSA: ctxfi: Add SB046x PCI ID
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Sat, 21 May 2022 10:19:59 +0200
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Adds the PCI ID for X-Fi cards sold under the Platnum and XtremeMusic names

Before: snd_ctxfi 0000:05:05.0: chip 20K1 model Unknown (1102:0021) is found
After: snd_ctxfi 0000:05:05.0: chip 20K1 model SB046x (1102:0021) is found

Signed-off-by: Edward Matijevic <motolav@gmail.com>
---
 sound/pci/ctxfi/ctatc.c      | 2 ++
 sound/pci/ctxfi/cthardware.h | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index 78f35e88aed6..fbdb8a3d5b8e 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -36,6 +36,7 @@
 			    | ((IEC958_AES3_CON_FS_48000) << 24))
 
 static const struct snd_pci_quirk subsys_20k1_list[] = {
+	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, 0x0021, "SB046x", CTSB046X),
 	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, 0x0022, "SB055x", CTSB055X),
 	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, 0x002f, "SB055x", CTSB055X),
 	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, 0x0029, "SB073x", CTSB073X),
@@ -64,6 +65,7 @@ static const struct snd_pci_quirk subsys_20k2_list[] = {
 
 static const char *ct_subsys_name[NUM_CTCARDS] = {
 	/* 20k1 models */
+	[CTSB046X]	= "SB046x",
 	[CTSB055X]	= "SB055x",
 	[CTSB073X]	= "SB073x",
 	[CTUAA]		= "UAA",
diff --git a/sound/pci/ctxfi/cthardware.h b/sound/pci/ctxfi/cthardware.h
index f406b626a28c..2875cec83b8f 100644
--- a/sound/pci/ctxfi/cthardware.h
+++ b/sound/pci/ctxfi/cthardware.h
@@ -26,8 +26,9 @@ enum CHIPTYP {
 
 enum CTCARDS {
 	/* 20k1 models */
+	CTSB046X,
+	CT20K1_MODEL_FIRST = CTSB046X,
 	CTSB055X,
-	CT20K1_MODEL_FIRST = CTSB055X,
 	CTSB073X,
 	CTUAA,
 	CT20K1_UNKNOWN,
-- 
2.36.1
