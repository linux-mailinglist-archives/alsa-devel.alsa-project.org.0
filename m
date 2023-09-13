Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA79979E15E
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 10:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB1599F6;
	Wed, 13 Sep 2023 10:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB1599F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694592092;
	bh=qL0B9VNm/S+KsaCvSXGsVmQJ4dEZvRBdkFd/8AlVxrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZVITLb8cWfXSPcI9a5hMsgMPIQvfyD26dTR2RWDVGgsJXdjvU4fozL9S5f9uaDnji
	 Su6np8y+cuLybTSkDpmfLu0my4XZu/2LJckeo3W7fzKNqYAZ4ZoD++01tR9hmrM77X
	 wyBcTZpmmt6munG+Z803lQNSgAd7BAItJCQgr1Dg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42924F8007C; Wed, 13 Sep 2023 10:00:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5689F80246;
	Wed, 13 Sep 2023 10:00:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A10C0F80425; Wed, 13 Sep 2023 10:00:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-1.mail.aliyun.com (out28-1.mail.aliyun.com
 [115.124.28.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEC11F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 10:00:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEC11F80212
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1324828|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00210616-0.000271328-0.997623;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047206;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=28;RT=28;SR=0;TI=SMTPD_---.Ue3l8iB_1694592017;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Ue3l8iB_1694592017)
          by smtp.aliyun-inc.com;
          Wed, 13 Sep 2023 16:00:26 +0800
From: wangweidong.a@awinic.com
To: krzysztof.kozlowski@linaro.org
Cc: 13916275206@139.com,
	alsa-devel@alsa-project.org,
	arnd@arndb.de,
	broonie@kernel.org,
	ckeepax@opensource.cirrus.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	fido_max@inbox.ru,
	harshit.m.mogalapalli@oracle.com,
	herve.codina@bootlin.com,
	krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	perex@perex.cz,
	povik+lin@cutebit.org,
	rf@opensource.cirrus.com,
	robh+dt@kernel.org,
	ryans.lee@analog.com,
	sebastian.reichel@collabora.com,
	shumingf@realtek.com,
	tiwai@suse.com,
	trix@redhat.com,
	wangweidong.a@awinic.com,
	yijiangtao@awinic.com
Subject: Re: [PATCH V2 4/5] ASoC: codecs: Change the aw88261 variable name and
 i2c driver name
Date: Wed, 13 Sep 2023 16:00:17 +0800
Message-ID: <20230913080017.364430-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <3ee11823-a441-b646-bdd7-aedd3a3a55e5@linaro.org>
References: <3ee11823-a441-b646-bdd7-aedd3a3a55e5@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4KSFPUNLRHUGNC37MWXI6Z3KTHBKKWMX
X-Message-ID-Hash: 4KSFPUNLRHUGNC37MWXI6Z3KTHBKKWMX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KSFPUNLRHUGNC37MWXI6Z3KTHBKKWMX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you very much for your review.=0D
=0D
On 13/09/2023 09:03, krzysztof.kozlowski@linaro.org wrote:=0D
> On 12/09/2023 08:58, wangweidong.a@awinic.com wrote:=0D
>> From: Weidong Wang <wangweidong.a@awinic.com>=0D
>> =0D
>> Change "sound-channel" to "awinic,audio-channel"=0D
>> Change "aw88261_smartpa" to "aw88261"=0D
=0D
I'll add "This change is for consistency with yaml properties" to the commi=
t message.=0D
=0D
>> -	prof_name =3D aw88261_dev_get_prof_name(aw88261->aw_pa, count);=0D
>> -	if (!prof_name) {=0D
>> +	ret =3D aw88261_dev_get_prof_name(aw88261->aw_pa, count, &prof_name);=
=0D
>> +	if (ret) {=0D
>>  		strscpy(uinfo->value.enumerated.name, "null",=0D
>>  						strlen("null") + 1);=0D
>>  		return 0;=0D
>> @@ -1189,7 +1190,7 @@ static void aw88261_parse_channel_dt(struct aw8826=
1 *aw88261)=0D
>>  	u32 channel_value =3D AW88261_DEV_DEFAULT_CH;=0D
>>  	u32 sync_enable =3D false;=0D
>>  =0D
>> -	of_property_read_u32(np, "sound-channel", &channel_value);=0D
>> +	of_property_read_u32(np, "awinic,audio-channel", &channel_value);=0D
>>  	of_property_read_u32(np, "sync-flag", &sync_enable);=0D
=0D
> What about this?=0D
=0D
This change is to be consistent with the name in the yaml file=0D
=0D
Best regards,=0D
Weidong Wang=
