Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4326130AB
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 07:47:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9DB2166A;
	Mon, 31 Oct 2022 07:46:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9DB2166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667198867;
	bh=Cxf6EyptefuSdnRnNeuH/OSPhqEKaSYrjC0JmD7LY+o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iYgZ8QJODvs/8cjN4F6DpJWAOAc7XTRzaZkjueqadIxjh8soEMKvSl6OnuZd80xkZ
	 JoNnYOwIiMqwy3cgK1XwDN5eoaKu/dUspMPfafNpBLfanI8vZpyTfQNSKx9sQ8C46d
	 E6OTQ0YKT6a0iTIgh6Mlyi+3RhPxDPLM/0EDIZ6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E10C8F800F3;
	Mon, 31 Oct 2022 07:45:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F17F6F8024C; Fri, 28 Oct 2022 17:26:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A4FCF800E1
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 17:26:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A4FCF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="ejIs5206"
Received: by mail-ed1-x52a.google.com with SMTP id z18so3369846edb.9
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Xs7ZsRPy5xlIirExLI4FhtsVOo8y0v5L1DiHF2jWjc=;
 b=ejIs5206nbaAuK0RqxKSO3KnxVkSkSEdaZROaSn1NkiUA30D/RHsdlnhd0jDWnd0fW
 F1aRf3pkS8GG/JCEP26OE38iZvZq2x6YT+RE1QWSBpGZKm5pCusFqlf+IL3yEO6fqRyl
 jZGtzOaaXaFi7Y7lYm4CpHdcg4kCx9HA/RMz3zwj6N4FY8Ui3sSjvSfK05yMQUyOX4MC
 lTdpBRmwof+6EYtMwJdHYg3xvW3aur1WC5aMPgFmXyEQBhPe1JoofuPoFVHjTldDxeOG
 CuOiS60PlCer4GrVWNOzi7+s00wyFrU1QkY6Ig1fGewf0z0bu8NzxUjeW5qmJ3z+HdkY
 GbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Xs7ZsRPy5xlIirExLI4FhtsVOo8y0v5L1DiHF2jWjc=;
 b=ihhcgVl+bFBH2RgwA3ogvQAo4cjSOrwnJwLHhT8TYgZ9EEA2JmtuBlj6YW1akatGLk
 WC8E1jpT/LcJz1M/5FSQSeYs6RwvVGMrnJc/JrX2emWqhXM2pgHgyLNgQc3DY5nej3Af
 dplNj4H//jU1WEdGZz4fkeo/ox6dq/hpSCuNOxzbfUHpno8EwXzh7msVkgJTwUOu2uI0
 8hpb2yIPxtSgqgL9AHa7CxL3UoXqdUv/Kh7S8ei1AMSbHs48mycpFy7JHAjSIbnROeQe
 Cne8b4b898Zp1xdTH/MPb+Wy35xhwvG8ginjcHdX2Us/oCgil7+0r6EAeJXja2tuH8Lr
 ihww==
X-Gm-Message-State: ACrzQf28Fw0fDnB/2dcqoz9XLHPtGNYZlVar8A6W8IcHJhiylX95ms+W
 IU4fF6dpBxVJ1CqryAfYZrZmp4FoVCa4qWrMT0g=
X-Google-Smtp-Source: AMsMyM7/ZhL91+wfPA6lrOcKKhoBGDKoL5RqFDfqXj5XpqzwoDEmxyjLAbIgLvC7FgYKRJI+nP942A==
X-Received: by 2002:a05:6402:5244:b0:461:d97e:5271 with SMTP id
 t4-20020a056402524400b00461d97e5271mr24382712edd.227.1666970808663; 
 Fri, 28 Oct 2022 08:26:48 -0700 (PDT)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be.
 [78.22.137.109]) by smtp.gmail.com with ESMTPSA id
 17-20020a170906319100b00730df07629fsm2349839ejy.174.2022.10.28.08.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 08:26:48 -0700 (PDT)
From: Maarten Zanders <maarten.zanders@mind.be>
To: 
Subject: [PATCH 0/3] ASoC: adau1372: fixes after debugging custom board
Date: Fri, 28 Oct 2022 17:26:22 +0200
Message-Id: <20221028152626.109603-1-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Oct 2022 07:45:34 +0100
Cc: alsa-devel@alsa-project.org, Maarten Zanders <maarten.zanders@mind.be>,
 linux-kernel@vger.kernel.org
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

Maarten Zanders (3):
  ASoC: adau1372: fix mclk
  ASoC: adau1372: add support for S24_LE mode
  ASoC: adau1372: correct PGA enable & mute bit

 sound/soc/codecs/adau1372.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)


base-commit: ef6747add3ad08a23a94b20db0b62688efb9ccd9
-- 
2.37.3

