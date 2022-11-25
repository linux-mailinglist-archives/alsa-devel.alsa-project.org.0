Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EEA6387AA
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 11:38:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EC37173C;
	Fri, 25 Nov 2022 11:37:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EC37173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669372681;
	bh=HlYnv3ZOITcGGDBm3S/T+zO7qFX73GK1CBSoQXq2yE8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nn7pRrYF5xj+y8aRNYyyCef/dUFT5dSFGw6SfSS7GPPKvWnHvIbTwHoIrQ1VEd2o6
	 7qF3NBi5fDVXK324d/JlRyx0DQ0oOve1jg4KlgbNke0/NN2TV1ATFoqS3y5heCDe70
	 p1DHFAjt3z/isowSrKErcq6Oh4in2UUq2zSYdfhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D416FF8047C;
	Fri, 25 Nov 2022 11:37:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E2F7F80236; Fri, 25 Nov 2022 11:37:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from out28-149.mail.aliyun.com (out28-149.mail.aliyun.com
 [115.124.28.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43D90F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 11:36:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D90F800B6
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1285414|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0107192-0.00252616-0.986755;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=18; RT=18; SR=0; TI=SMTPD_---.QGghMTz_1669372601; 
Received: from shaoer-VirtualBox.mshome.net(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QGghMTz_1669372601) by smtp.aliyun-inc.com;
 Fri, 25 Nov 2022 18:36:49 +0800
From: wangweidong.a@awinic.com
To: krzysztof.kozlowski@linaro.org
Subject: Re [patch v5 0/5] ASoC: codecs: Add Awinic AW883XX audio amplifier
 driver
Date: Fri, 25 Nov 2022 18:36:40 +0800
Message-Id: <20221125103640.17934-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <9cf9170a-bb01-ce61-2295-998fdf3b0909@linaro.org>
References: <9cf9170a-bb01-ce61-2295-998fdf3b0909@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: zhaolei@awinic.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, quic_potturu@quicinc.com,
 wangweidong.a@awinic.com, tiwai@suse.com, duanyibo@awinic.com,
 robh+dt@kernel.org, liweilei@awinic.com, cy_huang@richtek.com,
 yijiangtao@awinic.com, broonie@kernel.org, zhangjianming@awinic.com,
 krzysztof.kozlowski+dt@linaro.org
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

On 25/11/2022 10:27, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> The Awinic AW883XX is an I2S/TDM input, high efficiency
> digital Smart K audio amplifier with an integrated 10.25V
> smart boost convert
> 
> Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
> controlled using I2C.

> Do not attach your patchsets to some other patchsets. Each patchset is a
> separate email thread. The 5th patch is missing from the set - I don't
> know if because some sending/threading/spam problems....

Thank you very much for your advice. It was my mistake.
I will correct this error on patch v6

Best regards,
Weidong Wang
