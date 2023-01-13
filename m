Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F49668A62
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 04:47:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDF8193F7;
	Fri, 13 Jan 2023 04:46:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDF8193F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673581667;
	bh=haBhyEvSRhCx/HGvB6PEGrzH/zN7ubPwMkuZepZ6sqM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=icgtdM5c24YWYmx4q6yuDt1syFIrH+5CXQLYivNVMJJHI+PYOLvC1gxGqlmfO4U5E
	 a9rB+G3b08CI/XOoSseqAFTJ/DmIVuLlixOxLzPocYatvlkIFCp8fAkp7ZzCugOvAL
	 uipcqff8lpR8AjP+7quEewkeLaMisPh7RH8U/0ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67BB1F8019B;
	Fri, 13 Jan 2023 04:46:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07550F803DC; Fri, 13 Jan 2023 04:46:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from out28-4.mail.aliyun.com (out28-4.mail.aliyun.com [115.124.28.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEBFEF802E8
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 04:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEBFEF802E8
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1366565|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_social|0.0193387-0.00120227-0.979459; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047198; MF=wangweidong.a@awinic.com; NM=1; PH=DS; RN=28; RT=28;
 SR=0; TI=SMTPD_---.QrTXrBT_1673581583; 
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QrTXrBT_1673581583) by smtp.aliyun-inc.com;
 Fri, 13 Jan 2023 11:46:33 +0800
From: wangweidong.a@awinic.com
To: povik+lin@cutebit.org
Subject: Re: [PATCH V9 4/5] ASoC: codecs: Aw883xx chip register file,
 data type file and Kconfig Makefile
Date: Fri, 13 Jan 2023 11:46:23 +0800
Message-Id: <20230113034623.188604-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <5EA7B038-9B49-4E5D-8209-8689C0D03071@cutebit.org>
References: <5EA7B038-9B49-4E5D-8209-8689C0D03071@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: cezary.rojewski@intel.com, steve@sk2.org, llvm@lists.linux.dev,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 yangxiaohua@everest-semi.com, lkp@intel.com, daniel.beer@igorinstitute.com,
 pierre-louis.bossart@linux.intel.com, flatmax@flatmax.com,
 devicetree@vger.kernel.org, ckeepax@opensource.cirrus.com, zhaolei@awinic.com,
 james.schulman@cirrus.com, rf@opensource.cirrus.com, robh+dt@kernel.org,
 oe-kbuild-all@lists.linux.dev, jonathan.albrieux@gmail.com, tiwai@suse.com,
 liweilei@awinic.com, wangweidong.a@awinic.com, lgirdwood@gmail.com,
 yijiangtao@awinic.com, broonie@kernel.org, 13691752556@139.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 11/1/2023, at 9:38, povik+lin@cutebit.org wrote:
> Hi,

> the issue here would be that it’s possible to select your driver for compilation without
> having selected the CRC8 functions, leading to the linkage error.

> You can fix that by adding ’select CRC8’ under the Kconfig section of your driver, similarly
> to how the SND_SOC_SIGMADSP symbol selects CRC32.

Thank you very much for your advice. I will correct this mistake

> Best regards,
> Martin

Best regards,
Weidong Wang
