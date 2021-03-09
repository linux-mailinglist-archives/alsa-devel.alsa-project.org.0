Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64596332854
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 15:17:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9695174B;
	Tue,  9 Mar 2021 15:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9695174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615299431;
	bh=OwJ6dOwkhtcZrVKRSvU4fldoYMyzS2IxPhAhxkXfyP8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nS8UYcqRhaS4EuODV6fzw2lC7WFZIpwdq0rLX3NFEvgB9DKNd89hg5XfCVzWJd16u
	 T2R/Sp62c0dCA8hD+wBwBUXqfzDCTWjYZSA4knGLikQa2IeWISHUSJG+wv8N7lcZUG
	 kaq9swz3gqCFle2t4XjTlooszh38mu3GeVkf0ZPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EA34F8029B;
	Tue,  9 Mar 2021 15:15:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CF41F80275; Tue,  9 Mar 2021 15:15:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5056AF80166
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 15:15:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5056AF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cIR0awXA"
Received: by mail-wr1-x42b.google.com with SMTP id d15so15906380wrv.5
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 06:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ITjSKt2+hgLxV+pJeV70ZxWkeY46z8D/gW74nzxpexQ=;
 b=cIR0awXA4ZwNU6o+0+jVnRL7Babi+PksJnzMSiQ7MadA4GGA9063k/iup2S9q6G5uv
 wZ3uw7uVZjQv+dNVhtkz/shlR01AgsyXABjs+uNtJck975Uhehz0tpV5Vms01BN37L9r
 HbkZyKKoirlUdO4d/UUs542iUJ/oR5Ivxq4ca56n94Dn0WpLgZhsI9SjMOjDzl3Ef1AK
 oJxebeVWNWX3+PbhBXWNSZg0WTbsnxjccXA1I5yKTYs5rkVARjemLZiXiYhcXT4cn2/6
 7g5rrMgRlAd3mSsZVT6r5sKDwMPHVWOUQnPpgt7AdZu5e/09T22PNZNOtOz/5D3j4z7m
 uVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ITjSKt2+hgLxV+pJeV70ZxWkeY46z8D/gW74nzxpexQ=;
 b=FdrWDPDmO1omnEZxrtBNoFAuzhOpcLSHSWQwXoMZ7f8jzGygvuHuFsBwmRbWnKX4Go
 DPTiVR29w9CEAhAnNDyumaQuRD5wTfQB7iwxWBQ0G0XRakzL+5Bm4wsKhacc5zBdFT/J
 3O0axAVjFYtcHZv1fKAVta9EtEcmAwks4fiURu7W8Nqm2a7245Zxe4hW1FfnwpwYhveR
 dfHmhYpiFq+sR+tCGXetdSnNeh9e6nhaiL2TzH9vZVc+sb0QWajC9A3P9oXHEH7VEZ63
 qL/whnN8dRp8KxoNl7N/8WvPwoTEwu3DtmklqACJZdSd7DLLdA6PjWjCOY0foR8x7aWw
 qKow==
X-Gm-Message-State: AOAM533Lu71fPcP1C4qS/OD4rotXjYz9HdH2i61JZafVFxh/s+dnsBq9
 RyXi1J9DZwXjSUEtAEso1pVqEA==
X-Google-Smtp-Source: ABdhPJxDXMPd2fcO0YWat53zH3/GB5WmZ45cb3wtWE2C8qsiuF2eJgclfNU+g/If55JxBW+DEwPjcg==
X-Received: by 2002:a5d:4fcb:: with SMTP id h11mr29800438wrw.66.1615299332299; 
 Tue, 09 Mar 2021 06:15:32 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id u20sm28007579wru.6.2021.03.09.06.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:15:31 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/5] soundwire: add static port map support
Date: Tue,  9 Mar 2021 14:15:09 +0000
Message-Id: <20210309141514.24744-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

In some cases, SoundWire device ports are statically mapped to Controller
ports during design, however there is no way to expose this information
to the controller. Controllers like Qualcomm ones use this info to setup
static bandwith parameters for those ports.

A generic port allocation is not possible in this cases!
This patch adds a new member m_port_map to SoundWire device so that
it can populate the static master port map and share it with controller
to be able to setup correct bandwidth parameters.

As a user of this feature this patchset also adds new bindings for
wsa881x smart speaker which has 4 ports which are statically mapped
to the 3 output and 1 input port of the controller.

Tested it on DB845c and SM8250 MTP.

thanks,
srini

Srinivas Kandagatla (5):
  soundwire: add static port mapping support
  soundwire: qcom: update port map allocation bit mask
  soundwire: qcom: add static port map support
  ASoC: dt-bindings: wsa881x: add bindings for port mapping
  ASoC: codecs: wsa881x: add static port map support

 .../bindings/sound/qcom,wsa881x.yaml          |  9 ++++++
 drivers/soundwire/qcom.c                      | 30 +++++++++++++++----
 include/linux/soundwire/sdw.h                 |  2 ++
 sound/soc/codecs/wsa881x.c                    |  5 ++++
 4 files changed, 40 insertions(+), 6 deletions(-)

-- 
2.21.0

