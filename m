Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFD179E16D
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 10:04:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D316BA4B;
	Wed, 13 Sep 2023 10:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D316BA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694592277;
	bh=bd4INoUdW9M4jbKCEWGdTLG2RtrKLEYKJLaoKQXGhRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gxm09Js4GrqLOtOAFk6QxL9/7yU2nB8ctDr6uWoRmz8cz0JAz2oMJGDYfmCOdHdQM
	 bn7uAUsLufQK81T+ZD77AaVfVp2OvxVFKw2fIuW0xeV745OaBhWptDKj0orDakvSX4
	 IX9zogriRA2jyo+S6qr5A0txMXN4WmXGYaUP+zxk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1903DF80549; Wed, 13 Sep 2023 10:03:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FD0CF80246;
	Wed, 13 Sep 2023 10:03:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76C47F80425; Wed, 13 Sep 2023 10:03:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-169.mail.aliyun.com (out28-169.mail.aliyun.com
 [115.124.28.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C87A0F8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 10:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C87A0F8007C
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1099867|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0935481-0.000793447-0.905658;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047192;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=28;RT=28;SR=0;TI=SMTPD_---.Ue3S9t0_1694592196;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Ue3S9t0_1694592196)
          by smtp.aliyun-inc.com;
          Wed, 13 Sep 2023 16:03:24 +0800
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
Subject: Re: [PATCH V2 1/5] ASoC: dt-bindings: Adds properties to
 "awinic,aw88395"
Date: Wed, 13 Sep 2023 16:03:10 +0800
Message-ID: <20230913080310.364486-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cc6ad994-a3c3-03d6-6095-14e43f105314@linaro.org>
References: <cc6ad994-a3c3-03d6-6095-14e43f105314@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MXU6AJ45K3WAFLAC7GW4D572BZMJREQ4
X-Message-ID-Hash: MXU6AJ45K3WAFLAC7GW4D572BZMJREQ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXU6AJ45K3WAFLAC7GW4D572BZMJREQ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you very much for your review, but I have a question that I would lik=
e to consult=0D
=0D
On 13/09/2023 09:03, krzysztof.kozlowski@linaro.org wrote:=0D
> On 12/09/2023 08:58, wangweidong.a@awinic.com wrote:=0D
>> From: Weidong Wang <wangweidong.a@awinic.com>=0D
>> =0D
>> Adds properties to "awinic,aw88395" to make files more complete=0D
>> =0D
>> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>=0D
>> ---=0D
>>  .../bindings/sound/awinic,aw88395.yaml        | 19 +++++++++++++++++++=
=0D
>>  1 file changed, 19 insertions(+)=0D
>> =0D
>> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml=
 b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml=0D
>> index 4051c2538caf..4965aa4a5370 100644=0D
>> --- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml=0D
>> +++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml=0D
>> @@ -32,11 +32,28 @@ properties:=0D
>>    reset-gpios:=0D
>>     maxItems: 1=0D
>>  =0D
>> +  awinic,audio-channel:=0D
>> +    description:=0D
>> +      It is used to distinguish multiple PA devices, so that different=
=0D
>> +      configurations can be loaded to different PA devices=0D
>> +    $ref: /schemas/types.yaml#/definitions/uint32=0D
>> +    minimum: 0=0D
>> +    maximum: 7=0D
>> +=0D
>> +  awinic,sync-flag:=0D
>> +    description:=0D
>> +      Flag bit used to keep the phase synchronized in the case of multi=
ple PA=0D
>> +    $ref: /schemas/types.yaml#/definitions/uint32=0D
=0D
> Looks like bool, not uint32. If you made it uint32 for some future=0D
> purpose, then the name "flag" is misleading and anyway what would be the=
=0D
> third option here for sync?=0D
=0D
Thank you very much. Can I Change it to "$ref: /schemas/types.yaml#/definit=
ions/bool"?=0D
=0D
Best regards,=0D
Weidong Wang=
