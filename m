Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 959DB710D73
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 15:41:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBBA9207;
	Thu, 25 May 2023 15:40:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBBA9207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685022097;
	bh=ZbyvfxbGwDwR86SXFgtZlx5RBhhQFDIKCVY7yyo/Nb0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k/4323KAuuJ8aw7OnXlGHcJl6GiUHOm0hRGe9fT6b7VEBifmbY5Wnkt/Jdys+YaYf
	 P3HVKqOHW4nbWb8ovqAk6hX994wOJPK7JuNnpm9tlb1lO/EH8KKf7OAWPfbRsJgfCM
	 klZf2du0EepfzBlxscYVODxlMHo2oShZHu00LR+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A711AF805A9; Thu, 25 May 2023 15:39:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7341EF80587;
	Thu, 25 May 2023 15:39:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0691F80552; Thu, 25 May 2023 15:39:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EC1BF8024E
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 15:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EC1BF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Weef7AvC
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30a95ec7744so2085479f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 25 May 2023 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685021926; x=1687613926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SErRfOq2zkA3FjIAS2Y61xvXXIJ9zVGPM+NkpQH62Dk=;
        b=Weef7AvCPpj7mh5qe30JYSMSv+gJ7DQyy/0hL3O1RtI3sM9NpNNtTrrH5fr3Eb8UA4
         uJSMt2R2c5T5F2aTRU3J308IiaRjvjTJ1wTgp6LRORvhlx+36nONPR6yRRnu7hUkjuL5
         iOqa2+cBt+p3ArnN8tRdXC/B4b7e3rrUQR/ovDdYVND+xufTNrzdIvsPfuDWcIVri2gB
         /jwC7S+n7g2aP3Lmc2pWC4G3G5hVlm5GFqSUcyd7nBfciDL6GOd4j8SjG3JBCYSh2iGg
         w0WFOJ4569ugVlpOUqXTZBM2HtWmYAelfzKIg/teOPEXbnKzoT7XBsUEGAk3SH5HzgHk
         7pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685021926; x=1687613926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SErRfOq2zkA3FjIAS2Y61xvXXIJ9zVGPM+NkpQH62Dk=;
        b=WcXbtikr4O1fd8S67wYLcHDzqC4eZhudjy2HKdBDhcai/sllen1wmUUMc86TWk5jmO
         UmjiSoflmkMVYxt1yhBGWz2J/d+Zjlb4H2Yzkco5JyaViTqdPwdksU3f0zU4PruIVvB/
         UqOVJNObItE+WEB/FIxADp0sgr9jbB2SJ62gM0IIcsShXyLz9Z/HA5vERfkDMjSJK/z+
         42iLRJWjNTxC8Sjuc29BFIdLZ8c7tvzqHK/NNVwGo3w1Ec5pXcGtmA14Yg5550Pc/VB/
         UlEj32b24JFwja6RSA0/ZRB/nGFrBvbNbikCJG6HNBVXJ2LLSuT0zsCETtxoxGuw2ovZ
         xdXQ==
X-Gm-Message-State: AC+VfDzYc96mh0YRjqneqc3sW2tGoyWO63kAll//7LX1pIVEc09mDixi
	oqMi+ZVEPAhf3su/vdODf/KB3w==
X-Google-Smtp-Source: 
 ACHHUZ4uHJMe3BdseysmijmVyN/Ttxo7RLQkKvYe/bEff1EjOtNqYdCjAhJkNcoKSOE+FzGCphTf9w==
X-Received: by 2002:a5d:58d6:0:b0:307:9194:9a94 with SMTP id
 o22-20020a5d58d6000000b0030791949a94mr2917781wrf.17.1685021926217;
        Thu, 25 May 2023 06:38:46 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a5d6551000000b00301a351a8d6sm1803641wrv.84.2023.05.25.06.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 06:38:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Cc: andersson@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	sanyog.r.kale@intel.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/4] soundwire: qcom: stablity fixes
Date: Thu, 25 May 2023 14:38:08 +0100
Message-Id: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J7IKF62K64WQWNAREBSBI7CP4YA4LNXJ
X-Message-ID-Hash: J7IKF62K64WQWNAREBSBI7CP4YA4LNXJ
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J7IKF62K64WQWNAREBSBI7CP4YA4LNXJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

During x13s audio testing we hit few corner cases due to issues
in codec drivers and some obvious code bugs.

Here are the fixes for those issues, mostly the issues are around
devices loosing the sync in between runtime pm suspend resume path.

With codec fixes along with these fixes, audio on x13s is pretty stable.

Thanks,
Srini

Changes since v1:
	- dropped runtime pm changes patch as unable to reproduced it anymore
	- fixed clk stop flag as suggested by Pierre
	- rebased on top of linux-next

Srinivas Kandagatla (4):
  soundwire: qcom: update status correctly with mask
  soundwire: qcom: wait for fifo to be empty before suspend
  soundwire: qcom: add software workaround for bus clash interrupt
    assertion
  soundwire: qcom: set clk stop need reset flag at runtime

 drivers/soundwire/qcom.c | 100 ++++++++++++++++++++++++++-------------
 1 file changed, 68 insertions(+), 32 deletions(-)

-- 
2.21.0

