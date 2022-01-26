Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3006149C8C7
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 12:37:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8C8B17CD;
	Wed, 26 Jan 2022 12:36:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8C8B17CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643197030;
	bh=5jFSJIeHor0swLYNOAkE0/AI2jIxB2QBHpD0E5uwYK0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JMHhiDJDheHqTXOS9Zv6uoOOcEzrAangZrLvgSzync0SuzEHbqfFSMELYvDqs1QIX
	 6JHP9zx6MEYs3kpjzCy2s5HygsdDIiwNU0nJjCSkAuXw+PYLz9gmZhRKmZU/Xg1JLA
	 lvfio58XeY/6oucU39u1Vxh0ZsCrol/vn5FWaG0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 118DCF804CC;
	Wed, 26 Jan 2022 12:36:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61758F804BC; Wed, 26 Jan 2022 12:36:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC9B8F80118
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 12:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC9B8F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="O6bf86A7"
Received: by mail-wr1-x42d.google.com with SMTP id e2so9851447wra.2
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 03:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tVkN4OAkdGyisUZxAmo/IqALBwMBj8OyZCisknx7/mA=;
 b=O6bf86A7Qxq2G/W/kK3ZYJqVRRc0uhzCfPARgrYMgZlXEiF5R65napOfGjyLjpT2Iq
 NSkXEMz1QLMIJuBLpECqGhF7dzqlUGB8SQTcqnvj9ogdfcZV7W2049/q8uAWtCIY/Yta
 aoi6PyBxkzLvDAkSB6O30w3LKktlpmZ3HEyrCUi6IrIG/t4pm/d6UzfAonz7C8Y/kQDP
 yXkiaoLb3UHwyEeEHK3UVkmqgLyanb1nVrKMyAXB9doRyHElr9YM0KW7zzF0SqMa0tmq
 cyTIaAUkWvMlzR3xnSmblf7OzjMOa/qhKNI5Fx13aCzJmaD7eqJgE5XNcffQkzFc4jPw
 ofEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tVkN4OAkdGyisUZxAmo/IqALBwMBj8OyZCisknx7/mA=;
 b=XSIwiNiRrADv9P7TxA8U/nk7AOJ6Ot3e1BfpGJKzJ6YVCTRoNQ6frR1PAzKoL+zNTX
 KM3kBYA8pRrhxm22N44mpo0Vbq8lGEuqnfXgsRG6Vbebdshe8ZgotaRyXKu3p48xRKYj
 7Fuc8OwgsWEOWQONaPtYb/bcPIlsRiMBnxmAAZPQN846wclEi2ClaLP/Sh/ckDlfheXA
 YTo60Zhr2745zoX1CUpNIH5RYvlxDxz1tVuE9pjhoFa5EwBl8BxN2Xxn1hDDCRLNO+Bi
 zF65FU090efSkcp4VTINQ0orfD/UfXaCeVFxxCKlD2anD5J680DAts6xN5VRFL8vcDlL
 Mh1A==
X-Gm-Message-State: AOAM532G77kQM8/GyoN6mfcVm7K1GQ8OFzhfpssRi39mw9vo3NvZvlnY
 q8BVe4a6yrDBdVkNDRO2zlNRfA==
X-Google-Smtp-Source: ABdhPJzgVBb4sDJ5KH3MciI/B5HZ8ZFYuQMgYxUIUMgbYZfGiijc7QVWVuf5VfWkQtp1aRnD2CEbDw==
X-Received: by 2002:adf:d1ed:: with SMTP id g13mr7249298wrd.682.1643196958858; 
 Wed, 26 Jan 2022 03:35:58 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id n14sm11999188wri.75.2022.01.26.03.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 03:35:58 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/4] ASoC: qcom: fixes for Qualcomm codecs and q6apm
Date: Wed, 26 Jan 2022 11:35:45 +0000
Message-Id: <20220126113549.8853-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

Some recent testing found few issues with wcd938x and lpass-tx codec drivers.
WCD938x was accessing array out of boundaries resulting in corruption and
system crashes along with not handling kcontrol put return values correctly
and rx-macro had incorrect sidetone registers offsets. One final fix in q6apm
to add a check if graph started before stopping it.


Thanks,
srini

Srinivas Kandagatla (4):
  ASoC: codecs: wcd938x: fix incorrect used of portid
  ASoC: codecs: lpass-rx-macro: fix sidetone register offsets
  ASoC: codecs: wcd938x: fix return value of mixer put function
  ASoC: qdsp6: q6apm-dai: only stop graphs that are started

 sound/soc/codecs/lpass-rx-macro.c |  8 ++++----
 sound/soc/codecs/wcd938x.c        | 31 +++++++++++++++++--------------
 sound/soc/qcom/qdsp6/q6apm-dai.c  |  7 +++++--
 3 files changed, 26 insertions(+), 20 deletions(-)

-- 
2.21.0

