Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E835768C3D
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 08:45:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6596823;
	Mon, 31 Jul 2023 08:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6596823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690785946;
	bh=mP0ob38/r8JYwf5gRRdiLx3LRZiX+TmsrB+4NpQjT3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eMUSi9F+QAuIpllZgMuVQwjIllzz8XpSIXIcKiQ0rTl3kjlAxvxyJSA1IFP1aDf1k
	 EKaPoo91rTah+iaBbX3tpJWdw1r02kAlSECoCJRN4zaUlUFjo8f+PWfFm4jVoc/7Kt
	 NqcH6carfHzn+DuGmCj2YD73tOF87QCHQfLrBYKM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EC7FF8053B; Mon, 31 Jul 2023 08:44:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27B9BF80163;
	Mon, 31 Jul 2023 08:44:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 597A6F8016D; Mon, 31 Jul 2023 08:44:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-218.mail.aliyun.com (out28-218.mail.aliyun.com
 [115.124.28.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 719F3F80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 08:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 719F3F80149
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1033707|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0227216-0.000302779-0.976976;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=26;RT=26;SR=0;TI=SMTPD_---.U4blfQE_1690785869;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.U4blfQE_1690785869)
          by smtp.aliyun-inc.com;
          Mon, 31 Jul 2023 14:44:31 +0800
From: wangweidong.a@awinic.com
To: krzysztof.kozlowski@linaro.org
Cc: 13916275206@139.com,
	alsa-devel@alsa-project.org,
	broonie@kernel.org,
	ckeepax@opensource.cirrus.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	doug@schmorgal.com,
	fido_max@inbox.ru,
	herve.codina@bootlin.com,
	krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	perex@perex.cz,
	povik+lin@cutebit.org,
	rf@opensource.cirrus.com,
	robh+dt@kernel.org,
	ryans.lee@analog.com,
	shumingf@realtek.com,
	tiwai@suse.com,
	trix@redhat.com,
	wangweidong.a@awinic.com,
	yijiangtao@awinic.com,
	zhangjianming@awinic.com
Subject: Re: [PATCH V3 5/5] ASoC: codecs: aw88261 chip register file,
 Kconfig and Makefile
Date: Mon, 31 Jul 2023 14:44:28 +0800
Message-ID: <20230731064428.4158-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <c4cc2dfa-ca3f-1d51-8a3b-a131ccc54d03@linaro.org>
References: <c4cc2dfa-ca3f-1d51-8a3b-a131ccc54d03@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: V6XNXAEWDE5SSCR4JUFX4WK2ZHVJA6LX
X-Message-ID-Hash: V6XNXAEWDE5SSCR4JUFX4WK2ZHVJA6LX
X-MailFrom: wangweidong.a@awinic.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6XNXAEWDE5SSCR4JUFX4WK2ZHVJA6LX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you very much for your advice.=0D
=0D
> On 29/07/2023 11:12, wangweidong.a@awinic.com wrote:=0D
>> From: Weidong Wang <wangweidong.a@awinic.com>=0D
>> =0D
>> Mainly includes aw88261 register table, Makefile and Kconfig.=0D
>> =0D
>> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>=0D
>> ---=0D
>>  sound/soc/codecs/Kconfig               |  15 +=0D
>>  sound/soc/codecs/Makefile              |   3 +=0D
>>  sound/soc/codecs/aw88261/aw88261_reg.h | 374 +++++++++++++++++++++++++=
=0D
>>  3 files changed, 392 insertions(+)=0D
>>  create mode 100644 sound/soc/codecs/aw88261/aw88261_reg.h=0D
>> =0D
>> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig=0D
>> index c2de4ee72183..1e3526812cc8 100644=0D
>> --- a/sound/soc/codecs/Kconfig=0D
>> +++ b/sound/soc/codecs/Kconfig=0D
>> @@ -55,6 +55,7 @@ config SND_SOC_ALL_CODECS=0D
>>  	imply SND_SOC_ALC5632=0D
>>  	imply SND_SOC_AW8738=0D
>>  	imply SND_SOC_AW88395=0D
>> +	imply SND_SOC_AW88261=0D
>>  	imply SND_SOC_BT_SCO=0D
>>  	imply SND_SOC_BD28623=0D
>>  	imply SND_SOC_CHV3_CODEC=0D
>> @@ -640,6 +641,20 @@ config SND_SOC_AW88395=0D
>>  	  digital Smart K audio amplifier with an integrated 10V=0D
>>  	  smart boost convert.=0D
>>  =0D
>> +config SND_SOC_AW88261=0D
>> +	tristate "Soc Audio for awinic aw88261"=0D
>> +	depends on I2C=0D
>> +	select CRC8=0D
>> +	select REGMAP_I2C=0D
>> +	select GPIOLIB=0D
>> +	select SND_SOC_AW88395_LIB=0D
>> +	help=0D
>> +	  This option enables support for aw88261 Smart PA.=0D
>> +	  The awinic AW88261 is an I2S/TDM input, high efficiency=0D
>> +	  digital Smart K audio amplifier. The output voltage of=0D
>> +	  boost converter can be adjusted smartly according to=0D
>> +	  the input amplitude.=0D
>> +=0D
>>  config SND_SOC_BD28623=0D
>>  	tristate "ROHM BD28623 CODEC"=0D
>>  	help=0D
>> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile=0D
>> index b48a9a323b84..9df43de213f0 100644=0D
>> --- a/sound/soc/codecs/Makefile=0D
>> +++ b/sound/soc/codecs/Makefile=0D
>> @@ -49,6 +49,8 @@ snd-soc-aw8738-objs :=3D aw8738.o=0D
>>  snd-soc-aw88395-lib-objs :=3D aw88395/aw88395_lib.o=0D
>>  snd-soc-aw88395-objs :=3D aw88395/aw88395.o \=0D
>>  			aw88395/aw88395_device.o=0D
>> +snd-soc-aw88261-objs :=3D aw88261/aw88261.o \=0D
>> +			aw88261/aw88261_device.o=0D
>>  snd-soc-bd28623-objs :=3D bd28623.o=0D
>>  snd-soc-bt-sco-objs :=3D bt-sco.o=0D
>>  snd-soc-chv3-codec-objs :=3D chv3-codec.o=0D
>> @@ -431,6 +433,7 @@ obj-$(CONFIG_SND_SOC_ARIZONA)	+=3D snd-soc-arizona.o=
=0D
>>  obj-$(CONFIG_SND_SOC_AW8738)	+=3D snd-soc-aw8738.o=0D
>>  obj-$(CONFIG_SND_SOC_AW88395_LIB) +=3D snd-soc-aw88395-lib.o=0D
>>  obj-$(CONFIG_SND_SOC_AW88395)	+=3Dsnd-soc-aw88395.o=0D
>> +obj-$(CONFIG_SND_SOC_AW88261)	+=3Dsnd-soc-aw88261.o=0D
>>  obj-$(CONFIG_SND_SOC_BD28623)	+=3D snd-soc-bd28623.o=0D
>>  obj-$(CONFIG_SND_SOC_BT_SCO)	+=3D snd-soc-bt-sco.o=0D
>>  obj-$(CONFIG_SND_SOC_CHV3_CODEC) +=3D snd-soc-chv3-codec.o=0D
>> diff --git a/sound/soc/codecs/aw88261/aw88261_reg.h b/sound/soc/codecs/a=
w88261/aw88261_reg.h=0D
>> new file mode 100644=0D
>> index 000000000000..7ef128a3e6ee=0D
>> --- /dev/null=0D
>> +++ b/sound/soc/codecs/aw88261/aw88261_reg.h=0D
>> @@ -0,0 +1,374 @@=0D
>> +// SPDX-License-Identifier: GPL-2.0-only=0D
=0D
> If you add the headers now, it means they are not used in any previous=0D
> patches. Therefore drop the header - it is useless.=0D
=0D
I will combine this file with aw88261.c aw88261.h to form a patch #4.=0D
But I have a question as to whether the Makefile and Kconfig files =0D
need to be separate to make up patch #5?=0D
=0D
Best regards,=0D
Weidong Wang=0D
