Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF07AB7F2A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:48:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E00DE61664;
	Thu, 15 May 2025 09:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E00DE61664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747293913;
	bh=1UwSOIDlD3ic60nJ1mkNJNnPI8CaGS+D6mHUgFP9Qv8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bA7IWWcav9HHQWvDahC8TieqtQXw/59gAqKemjeIItN8nwU4Qy8FNLQmb5sYhpZs9
	 H3JxVXiEkPCmRHWNiAWYAKvAp4EGANlUuYyiluIGCCWdCy6EsHjJBI2s98Q7+r4za0
	 0dgDOzutGLEKqpHGL+4GH7ytSgUt44ZmgtzKa6KQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92D72F897C4; Sun, 11 May 2025 16:32:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77D49F897B2;
	Sun, 11 May 2025 16:32:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A4DDF8EC21; Thu,  1 May 2025 16:14:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A5FDF8EC1C
	for <alsa-devel@alsa-project.org>; Thu,  1 May 2025 16:14:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A5FDF8EC1C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.a=rsa-sha256
 header.s=s1 header.b=qh/QxvR/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1746108822; bh=1UwSOIDlD3ic60nJ1mkNJNnPI8CaGS+D6mHUgFP9Qv8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=qh/QxvR/kNaj8aKiL4KL/ex5wocOuIwxzTh6HinxhAs7xsP4QRghKdlxZ42jy/bwL
	 CvbOpsuFKspfmy3D/UJFLo9wG867z8CoY2lL8RwkwZHnG8XeDEz7aB95BW0X6eHVvx
	 F0bHsjE7uX4qKhU6hKcdXQ0upwKUE7ig5cUb2bhQ=
Date: Thu, 01 May 2025 16:13:40 +0200
From: Luca Weiss <luca@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht,
 Srinivas Kandagatla <srini@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
CC: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/5=5D_ASoC=3A_qcom=3A_sm8250?=
 =?US-ASCII?Q?=3A_set_card_driver_name_from_match_data?=
In-Reply-To: <aBNdCRk_fP2q1vxQ@srini-hackbase>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
 <aBNdCRk_fP2q1vxQ@srini-hackbase>
Message-ID: <91110CA9-6E83-4811-AA04-C0312B99B95E@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: luca@lucaweiss.eu
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VIBHFEWWCK52MVE6ZSRRLVL5TIJMQIPP
X-Message-ID-Hash: VIBHFEWWCK52MVE6ZSRRLVL5TIJMQIPP
X-Mailman-Approved-At: Sun, 11 May 2025 14:32:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIBHFEWWCK52MVE6ZSRRLVL5TIJMQIPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Srini,

Srinivas Kandagatla <srini@kernel=2Eorg> schreef op 1 mei 2025 13:37:45 CE=
ST:
>On Fri, Apr 25, 2025 at 10:07:26AM +0200, Luca Weiss wrote:
>> Sound machine drivers for Qualcomm SoCs can be reused across multiple
>> SoCs=2E But user space ALSA UCM files depend on the card driver name wh=
ich
>> should be set per board/SoC=2E
>>=20
>> Allow such customization by using driver match data as sound card drive=
r
>> name=2E
>>=20
>> Also while we're already touching these lines, sort the compatibles
>> alphabetically=2E
>>=20
>> Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@oss=2Equalcomm=2Ecom>
>> Reviewed-by: Neil Armstrong <neil=2Earmstrong@linaro=2Eorg>
>> Signed-off-by: Luca Weiss <luca=2Eweiss@fairphone=2Ecom>
>> ---
>>  sound/soc/qcom/sm8250=2Ec | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/sound/soc/qcom/sm8250=2Ec b/sound/soc/qcom/sm8250=2Ec
>> index b70b2a5031dfbf69024666f8a1049c263efcde0a=2E=2Ee920b413b762c803cfc=
c4049f35deba828275478 100644
>> --- a/sound/soc/qcom/sm8250=2Ec
>> +++ b/sound/soc/qcom/sm8250=2Ec
>> @@ -16,7 +16,6 @@
>>  #include "usb_offload_utils=2Eh"
>>  #include "sdw=2Eh"
>> =20
>> -#define DRIVER_NAME		"sm8250"
>>  #define MI2S_BCLK_RATE		1536000
>> =20
>>  struct sm8250_snd_data {
>> @@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_=
device *pdev)
>>  	if (ret)
>>  		return ret;
>> =20
>> -	card->driver_name =3D DRIVER_NAME;
>> +	card->driver_name =3D of_device_get_match_data(dev);
>>  	sm8250_add_be_ops(card);
>>  	return devm_snd_soc_register_card(dev, card);
>>  }
>> =20
>>  static const struct of_device_id snd_sm8250_dt_match[] =3D {
>> -	{=2Ecompatible =3D "qcom,sm8250-sndcard"},
>> -	{=2Ecompatible =3D "qcom,qrb4210-rb2-sndcard"},
>> -	{=2Ecompatible =3D "qcom,qrb5165-rb5-sndcard"},
>> +	{ =2Ecompatible =3D "qcom,qrb4210-rb2-sndcard", =2Edata =3D "sm8250" =
},
>
>sm4250 for rb2?

Since this name is visible to user space and used for picking the UCM conf=
ig, I don't think it's a good idea to change it=2E

Regards
Luca

>
>> +	{ =2Ecompatible =3D "qcom,qrb5165-rb5-sndcard", =2Edata =3D "sm8250" =
},
>> +	{ =2Ecompatible =3D "qcom,sm8250-sndcard", =2Edata =3D "sm8250" },
>>  	{}
>>  };
>> =20
>>=20
>> --=20
>> 2=2E49=2E0
>>=20
