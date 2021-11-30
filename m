Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 112BD463AFB
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 17:06:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5438322A5;
	Tue, 30 Nov 2021 17:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5438322A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638288377;
	bh=WsPcXZoIUO3joVDWmmG9pCPQFvRtM28JbAXENVyOqeU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lk3vLP9VEgcShu3j4AWJRFOWqB3PTSuNqAfwb9ziK54hFnFFqNmloG5pyv9qrJa/f
	 CPZGv1khMwzyDnlO2mjYycavw0YcUznEVj0TAuZV7TS6ZHmTsEBkXrkQXXZaJStyYc
	 /npT6EmN+d3J4lLRl6nG6CPRCl/6o30ZUt3Zb7PI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CB5EF80301;
	Tue, 30 Nov 2021 17:05:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B791F802E0; Tue, 30 Nov 2021 17:05:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 852B0F8020D
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 17:05:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 852B0F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QZvkppd9"
Received: by mail-wr1-x434.google.com with SMTP id s13so45592224wrb.3
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 08:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6PRs/V5Y6EZpCMvgrkcxuv2VbEomGkCv99QDJI2/D6Y=;
 b=QZvkppd9P5giq/9M1iqXis1VxuATz7zInnbzIpy/JjA3s1NNpbZhGgexmMgs+RmOsh
 9Cim6xRCCzyWB0QLuXrRX+i7UKoTZt5FWqtmTPxtYuxN0avB5IO1a59X+52HkU5iGNRJ
 Z0HSvR5oIjFRiZEESzLE5EGTRlWMfXc552WTpLNBXqXklvFUrmz66OVICvKp53VAYjPf
 JQ2cJdnxzT8x9fqD8yxwWGac6yY3/vzjfmTDvmoIMMTbuzeHmYQttVqyytSuo3a74k+/
 QYevSNWq509c6ndGIXGp5a4oZq08Plrqk55nR+3c4hEQ3A/QZgRbCtFmUIbwWAemWhpz
 ldqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6PRs/V5Y6EZpCMvgrkcxuv2VbEomGkCv99QDJI2/D6Y=;
 b=VB8kj7+daxxRRkJo1nub466Mnf9sY4x2OasGrLNpz0UsQvlO3U32mRpZ39sgrsn03d
 LojOBhcpXQHLHkkg0PIMRIdGqbIOOY7oPznxCfoJErF22c0CbdDRK+55a9V7Lx6ytfcu
 AuTEQh0CmYVxV2SnrCxSLyS1T+88QsmPMJZdeVsJbUIqroAYY3U3fZSmIW0n8Jb6VLMY
 p1QVQVLiVY2CWaHXBW0umaBnr6ukfG+ZZ7FA6JGAB+HenuxPx7qGwoHFXkmzGpnVn+oH
 p2r6jqbhg4v8NXqlOzWAv0yzyuIMvbM0lPh+tTfNh8RQjoY75VMK3qERaa/aDjw66NQw
 hiJQ==
X-Gm-Message-State: AOAM531fjJXpyvdgI7yXHyYB/EJAeQvFQOVaiOqObobEbmRT2ML8BFz8
 bZs+yNhlnXrYTWxhVqv3cAwJF1BYNhS5Og==
X-Google-Smtp-Source: ABdhPJwMnk8pb7ycRX8NcND9sOZ1Q7oJAh+z9HlheUzdx6PaqI2H9zSzan6Eor/lSXf3ayYReeh4Gg==
X-Received: by 2002:a5d:62c5:: with SMTP id o5mr41555909wrv.408.1638288313240; 
 Tue, 30 Nov 2021 08:05:13 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id g18sm16719409wrv.42.2021.11.30.08.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 08:05:12 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/4] ASoC: codecs: Qualcomm codecs fix kcontrol put return
 values
Date: Tue, 30 Nov 2021 16:05:03 +0000
Message-Id: <20211130160507.22180-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

Hi Mark,
Some recent testing found few issues with wcd934x and wsa881x codec drivers that
are not handling kcontrol put correctly. This patchset fixes those instances.
Along with this there is also a bug fix for the way channel list was updated for
wcd934x dais.

--srini


Srinivas Kandagatla (4):
  ASoC: codecs: wcd934x: handle channel mappping list correctly
  ASoC: codecs: wcd934x: remove redundant ret variable
  ASoC: codecs: wcd934x: return correct value from mixer put
  ASoC: codecs: wsa881x: fix return values from kcontrol put

 sound/soc/codecs/wcd934x.c | 132 ++++++++++++++++++++++++++-----------
 sound/soc/codecs/wsa881x.c |  16 +++--
 2 files changed, 107 insertions(+), 41 deletions(-)

-- 
2.21.0

