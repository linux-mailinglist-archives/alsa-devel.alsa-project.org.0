Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EDD2FD7AD
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 19:03:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46C0A17BB;
	Wed, 20 Jan 2021 19:02:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46C0A17BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611165797;
	bh=MK+5+1Wf7ivrurc2TbTtumE9qJhJ4UsmE/fdj8B6/zI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qtkqjYsnSQQVnajN3FDRXCSfFM9SX97KAXpTyhdUVPUJUqIJdplMqV+A544plT9/c
	 L8++E8VY3/jg/8Ji+M42AxQK7RShKvTFQMVJ4ikOD7Er4+Rz3p4Uo67fuvgb92vngM
	 oDBUEvuXmpSvPMZBo3M78NulkB8VZNZW/xP16fC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C61D5F80227;
	Wed, 20 Jan 2021 19:01:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB539F8016E; Wed, 20 Jan 2021 19:01:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CCD6F8012C
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 19:01:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CCD6F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zS+WYqe2"
Received: by mail-wm1-x329.google.com with SMTP id u14so3624464wmq.4
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 10:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JAOkhmmw4YQR+9PHOdtL+6u+JGaYw59w2erSNxO3s34=;
 b=zS+WYqe2z+ivR2E7NhWrRijMEKh3TXKg3og1Ym5rPg0gZ0gyFOQoEcCAvjtJqwaXRU
 3jlgt0XPHSPqjpAE7cG8TB0bjxoT3hodDywTSuYhpdFknpggZYEGHB52yqPuFTteVYeW
 kk2UXtwVP6CVrLOsk1nj8+Am6MAfCSAUEe4jo/jHqKVbs/+lNwiWXDcRDkS3wf29/Xsw
 aEtqcua0WJsDpatK47IZDrgVDJZhYeczSLMYPXJAzMWOmMd+aUiS9bU3KgphGE74D/GW
 ZWk2cVL5v9RPY5eMTZTZb+ENnFQ+4ggcgTAPoDHVEWsvVmDDK+gIk/EjO7UaxGIkB6Qg
 fACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JAOkhmmw4YQR+9PHOdtL+6u+JGaYw59w2erSNxO3s34=;
 b=V/KX/343dch+dclC+GEPr8KMHNZzjf07EVFrTtypAfZAtvwHq6dM8UupmGGHxN93yW
 naS70u2Zn3OzX8OEBkLlwxtdijdFos5GPwDdz28vPrIq3gvgjH/84o8W+F8gpILPHSi8
 MfwHZqjYbwra73WRQXKxmkRmDQQRqaTMVEagVU1nPIHTvXJ95C2Ur143OD+cK0nnggUc
 /AC/p03LoOf9W3UKhT2eaa7yP4x6rrz19itRKBc9IhJIMiylZlr6htch9q8p2mxyd4hq
 KimUjhzfEQ9galXLv0NaA3WFugE5A1nWLXMsEae1iz0COPml6pWqw3jUyKARMHsO0wzd
 PCSw==
X-Gm-Message-State: AOAM5306BJcoAP/IAwabH6Defc0rP4Jvvq/q3VfUzQy6SnqLkX73qSSB
 VWDj+btED4KoeA2Pv/E11UJ1pQ==
X-Google-Smtp-Source: ABdhPJyfoVE50bx/HXCgAJ0HczPq65R4zDz9RIgAi2BDIBSdZSIADIH7dz07Q9YIlnzDbFnyyw9efQ==
X-Received: by 2002:a1c:18e:: with SMTP id 136mr5528719wmb.69.1611165699157;
 Wed, 20 Jan 2021 10:01:39 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g194sm5267422wme.39.2021.01.20.10.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 10:01:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [RFC PATCH 0/2] soundwire: add static port mapping support
Date: Wed, 20 Jan 2021 18:01:08 +0000
Message-Id: <20210120180110.8357-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com
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

Some of the soundwire controllers can have static functions assigned
to each port.

One Example : Master Port Num 1 and 2 are for PCM streams
Master Port 3, 4 can do PDM streams

Now Codecs that are on PDM should only assign Port 3 and 4.
simillarly PCM Codecs should be assigned port 1 and 2.

Other examples can include some usecase based mappings.

In such cases its not correct to assign/map any free port on master.
Currently there is no way to pass this static mapping from Slave to Master ports.

This patch provides a way to pass mapped port number along with the existing
port config structure during stream config, so that master can assign correct
ports based on the provided static mapping.

Srinivas Kandagatla (2):
  soundwire: add support for static port mapping
  soundwire: qcom: add support for static port mapping

 drivers/soundwire/bus.h       |  4 ++++
 drivers/soundwire/qcom.c      | 11 +++++++++--
 drivers/soundwire/stream.c    |  4 ++++
 include/linux/soundwire/sdw.h |  4 ++++
 4 files changed, 21 insertions(+), 2 deletions(-)

-- 
2.21.0

