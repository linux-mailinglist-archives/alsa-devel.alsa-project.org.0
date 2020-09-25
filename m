Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 819E8278EBE
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 18:37:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12E51187A;
	Fri, 25 Sep 2020 18:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12E51187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601051868;
	bh=plHtH+v8QHkwQK6+KlTjSRBtXt3QxWXVn0MTJPzPmXc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l5bwhxFI1yb15ZQsXCaOAc98V9ZiWT1paUi6di1MhXeoueGP25fin+omRR8y2Jywq
	 j3KM9OSgLIZT0y7Yi5pAx/mQP02847p6keRcRBHGuANGIOl9ZttHPiVN7xFdzjM8sn
	 Mng188CSesSrpr04MOvxn/p0QGZJ62r1p7dHd2w0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6837F80171;
	Fri, 25 Sep 2020 18:36:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE723F801EB; Fri, 25 Sep 2020 18:36:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9362F80162
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 18:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9362F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QXN0SmqS"
Received: by mail-wm1-x343.google.com with SMTP id e11so2251708wme.0
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rmounVMbkghHgQw2uLZEbV9nHVzbf0HPhUzVBFiceS8=;
 b=QXN0SmqSBLpJhF4hEknAPQ8enuiO8VPjiS9tRN9ap8b0aNsnIQWw3AhnnoAdsBdu0x
 2fymvW2WlHnWBNg0KykMkwPIRAGEdKGoroMfJ4P97tWY4og9k7YvybCGsaHL8g3w0UC3
 m3YeLXrjZAIHJ0Yr1aiY4YNjBOXyC2dN15/kjAfScHxlM5qy3Ovt4Agu8M3xM8me/TGA
 GllxG2ldZJ7UGrAsza6vVtW25uCYOYo2RvZHmnl3Zc6aFCWc0XH2pYgsgo/T/36pUSFu
 hxZFuJ/2B4W/xZDG3Ux52ZQfC0anhTeDCroW8GkbHU9SrKwYGW4jDldJkzPD5D3Ik6CA
 /O8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rmounVMbkghHgQw2uLZEbV9nHVzbf0HPhUzVBFiceS8=;
 b=ODnDFpxLdpIhFXWQoBvashZO4BPUcjnuFzlSNhSb0DhMASf2YKtHUcaKCrkH3ATA6u
 1wBiACxEh6lZ172FQRocA0dTxARhJZ5GUNCe0JdT7NLdi57tyWu9zF3DZl9iCTVaFy3U
 bLC3z6b1LA8LfzmDHRzyOjeexAGXkr3bVne+4tQgOMPiUcVk3jzrNSsS8sZPYpLqoVbA
 VIV2Go3QJk3C6RVlKUqJHnBom8zeT7uqIeiqqLaAR6IXdyBPm8kXgmA6qJ/zlSeIgB4r
 OIrURbZ0n9EbRy6aSeqApqqs38iol/yjaDDCFJcs+vchEKYPGUzzf71R6sjkyuw63uXR
 aj0A==
X-Gm-Message-State: AOAM533pgBuY2zHFRgixIEiomdqaor+MRynSfdny3T1F89/XTuqMBzo4
 pz3NA/pjRlvRC4cs+2h3R83KCw==
X-Google-Smtp-Source: ABdhPJxAXyw/Uff+CZFsPVEwnxt5gil9qvEfqgid+fiQzJHexwNZxXuvWrEkPU+tiETs5WCKuWMbdQ==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr3968205wml.176.1601051755421; 
 Fri, 25 Sep 2020 09:35:55 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m4sm3733883wro.18.2020.09.25.09.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 09:35:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 0/2] ASoC: qdsp6: fix some warnings when build without
 CONFIG_OF
Date: Fri, 25 Sep 2020 17:35:50 +0100
Message-Id: <20200925163552.20717-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, tiwai@suse.com
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

Here are fixes for two warnings types discovered while building qdsp6 drivers
without CONFIG_OF and with W=1

One of them was reported by Intel kernel test robot on q6afe-clocks patch, which
equally applies to rest of the qdsp6 drivers.

changes since v1:
	- added ifdef CONFIG_OF instead of removing of_match_ptr

Srinivas Kandagatla (2):
  ASoC: qdsp6: add ifdef CONFIG_OF around of_device_id
  ASoC: q6asm: fix kernel doc warnings

 sound/soc/qcom/qdsp6/q6adm.c        | 2 ++
 sound/soc/qcom/qdsp6/q6afe-clocks.c | 2 ++
 sound/soc/qcom/qdsp6/q6afe-dai.c    | 2 ++
 sound/soc/qcom/qdsp6/q6afe.c        | 2 ++
 sound/soc/qcom/qdsp6/q6asm-dai.c    | 2 ++
 sound/soc/qcom/qdsp6/q6asm.c        | 6 ++++++
 sound/soc/qcom/qdsp6/q6core.c       | 2 ++
 sound/soc/qcom/qdsp6/q6routing.c    | 2 ++
 8 files changed, 20 insertions(+)

-- 
2.21.0

