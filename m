Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1676579E18E
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 10:08:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BE4EDE5;
	Wed, 13 Sep 2023 10:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BE4EDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694592482;
	bh=eJyuHFRjexaWHWqX1/G2mRa530CLo0b67fvtJR0OV4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Np3ETgAxwQXLmXANHLhDEDsO4NJNEDfgZaIDAa2dCnlk2rh0cKUdpWNQLIHH74nKJ
	 7iCC37FRLQqk6hdWDx28UJuBDtn05lpNNz/9K67PFxjo7P3YF/WGJyJLteK8U3q8GO
	 xflP1e7b4FBOlQ+8lEbY2GbgYkH/07NcGkv0A9Z8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C1B0F8055C; Wed, 13 Sep 2023 10:07:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8F62F80246;
	Wed, 13 Sep 2023 10:07:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B300F80425; Wed, 13 Sep 2023 10:07:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-218.mail.aliyun.com (out28-218.mail.aliyun.com
 [115.124.28.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B812F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 10:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B812F80212
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.09614743|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.110075-0.000808817-0.889117;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047212;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.Ue3VeMa_1694592409;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Ue3VeMa_1694592409)
          by smtp.aliyun-inc.com;
          Wed, 13 Sep 2023 16:06:58 +0800
From: wangweidong.a@awinic.com
To: robh@kernel.org
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
	ryans.lee@analog.com,
	sebastian.reichel@collabora.com,
	shumingf@realtek.com,
	tiwai@suse.com,
	trix@redhat.com,
	wangweidong.a@awinic.com,
	yijiangtao@awinic.com
Subject: Re: [PATCH V2 1/5] ASoC: dt-bindings: Adds properties to
 "awinic,aw88395"
Date: Wed, 13 Sep 2023 16:06:48 +0800
Message-ID: <20230913080648.364569-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912162122.GA880119-robh@kernel.org>
References: <20230912162122.GA880119-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M6FHSAKUFCKWAEUUK6SXBQGR5YY6GEIO
X-Message-ID-Hash: M6FHSAKUFCKWAEUUK6SXBQGR5YY6GEIO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6FHSAKUFCKWAEUUK6SXBQGR5YY6GEIO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you very much for your advice, and I will modify it in the next patch.

On Tue, Sep 12, 2023 at 11:21:22PM -0500, robh@kernel.org wrote:
> On Tue, Sep 12, 2023 at 02:58:48PM +0800, wangweidong.a@awinic.com wrote:
>> From: Weidong Wang <wangweidong.a@awinic.com>

> The subject is still pretty generic. Ideally, we'd never have the same 
> subject twice. I'd do something like this:

> ASoC: dt-bindings: awinic,aw88395: Add properties for multiple PA support

Thank you very much. I will modify according to your suggestion in the next patch

>> 
>> Adds properties to "awinic,aw88395" to make files more complete

> Complete in what way? multiple PAs, right. It's not really clear 
> to me though how these properties enable support for multiple PAs.

Thank you very much. I will change the following content in the next patch:
Add two properties, the "awinic,audio-channel" property and the
"awinic,sync-flag". The "awinic,audio-channel" is used to make 
different PA load different configurations, the "awinic,sync-flag"
is used to synchronize the phases of multiple PA. These two properties 
will be read by the corresponding driver, so that the multi-PA to 
achieve better playback effect.

>> 
>> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
>> ---
>>  .../bindings/sound/awinic,aw88395.yaml        | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
>> index 4051c2538caf..4965aa4a5370 100644
>> --- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
>> +++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
>> @@ -32,11 +32,28 @@ properties:
>>    reset-gpios:
>>      maxItems: 1
>>  
>> +  awinic,audio-channel:
>> +    description:
>> +      It is used to distinguish multiple PA devices, so that different
>> +      configurations can be loaded to different PA devices
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 7
>> +
>> +  awinic,sync-flag:
>> +    description:
>> +      Flag bit used to keep the phase synchronized in the case of multiple PA
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 1
>> +
>>  required:
>>    - compatible
>>    - reg
>>    - '#sound-dai-cells'
>>    - reset-gpios
>> +  - awinic,audio-channel
>> +  - awinic,sync-flag
>>  
>>  unevaluatedProperties: false
>>  
>> @@ -51,5 +68,7 @@ examples:
>>              reg = <0x34>;
>>              #sound-dai-cells = <0>;
>>              reset-gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
>> +            awinic,audio-channel = <0>;
>> +            awinic,sync-flag = <0>;
>>          };
>>      };
>> -- 
>> 2.41.0
>>
