Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 147074685A6
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:39:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8186721F5;
	Sat,  4 Dec 2021 15:39:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8186721F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638628790;
	bh=7pgg+1u0+ZH7zsGEatQ3UB4LT0TWPXgCbu3efrCJQAY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XWi3u6BRud93rAo8ig/d9HZR01thUxCp8hCKib5qkl8YMQck6myEK4Gv3wktFCSqi
	 yGzASckJ4BE5ij1efT2wiTGh1HMlpAVSKjEvZX6u2aucS9OX45CvHGJ3WABG5/hT9G
	 umMNJG7r3gSt25s92cTnn/zyik7rjI7fh/2w9RE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A435AF802DB;
	Sat,  4 Dec 2021 15:37:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39F2EF8024C; Sat,  4 Dec 2021 15:37:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DA01F80134
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DA01F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KGnKA/dQ"
Received: by mail-lj1-x22f.google.com with SMTP id m12so11928137ljj.6
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eb7uDgOyBpxldHIEI+VonaK+Xu/ASCFuEjbDdDXN+6A=;
 b=KGnKA/dQc8pbQH0H3RIo4qaNKiRY7d6IAIGib9U78EeBrBD/UO9dBe39jn6NgwttBT
 jNS8LifWCAC6/vvC65qiJ585D9msh7sKwa2ZYt9WGQa6By9MrbEE/f5CC5RsaJ0mIIB2
 TJbx5dCfEdNn+VlHCLE/7DollFvrYKaP3BZ8zUtdAjX5rJHLshRJ4iHArEL57GLRzotm
 FPRXwdsppJ+fypDqncS0FQ2Xnkm92/QOqvfu0yQ9Do6TDxruI30g9yzSURNHxDvHQUWU
 CNsfOhgo0bGgWEqY9ECgmDBN1xOjLkEftjUTzDxwrnaKbQ6JrujXIJartr0qyZVNSC2f
 ADnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eb7uDgOyBpxldHIEI+VonaK+Xu/ASCFuEjbDdDXN+6A=;
 b=FimCeeKV762q2VLTa/EwsKIvCX8R7axlYQh58n4qBRPp2GT8Zp3tK/FRGnGN5Fc/Ad
 8RR2GbQEx65mbsonoqPC2PL81szDaROCLG92r8zHaiH3WDtGAdCxCclyfbWn0s6hwDwE
 yFeqz5hcjXNUEBblGiSMUthloG5WHWAK2a/tkoMSRhUKqjnU9ftTc6uqnZO11q/Y0rdF
 iOt/o6zAGT2w/RNIQLakvccCXTRu95T9b47MOZZBrE8c/y88saQ7n8HUEY7iWxM5s9/h
 bck17ILEFZYTgLCnlg6cRqfPXqZEWrQbw1mcByD4zFpRHL0av9vbJ+puSmdDuhxbPS+D
 qKZw==
X-Gm-Message-State: AOAM530x2Qairv8XPjdSdEmqA3PbE51sIMlH8gv5tp+NJO/7QsF5OWLW
 Eakzi7lJTn9m3FPDOmhuEsA=
X-Google-Smtp-Source: ABdhPJxG9CwWehDg+cjNOGJNJ68s2+9n0UqBCW/yFW5nzEyc+H1ZMEC6RTa4ZNUFnEefQ+7xWgLCFQ==
X-Received: by 2002:a2e:9017:: with SMTP id h23mr24483040ljg.13.1638628654467; 
 Sat, 04 Dec 2021 06:37:34 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:34 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 04/22] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
Date: Sat,  4 Dec 2021 17:37:07 +0300
Message-Id: <20211204143725.31646-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

Document new optional sound-dai-cells property of HDMI node. This node will
be used as endpoint of HDMI sound DAI graph.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index e61999ce54e9..27b746f28f31 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -297,6 +297,7 @@ of the following host1x client modules:
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
   - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - #sound-dai-cells: Should be 0.
 
 - tvo: TV encoder output
 
-- 
2.33.1

