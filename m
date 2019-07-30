Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E767AAA3
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 16:12:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4004C171B;
	Tue, 30 Jul 2019 16:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4004C171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564495950;
	bh=Dj6zDl+mcq4AJ4utMot6TEPnX92XNxZL+5lZg0gGrNE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jwdn0bsIW0HQBFCQWZFufOYopSpUyFWsi4N+v3KRcylGZ1+4j5+Z8BAXAJy670csW
	 3Q8cnoj5b3P+QvjFsMLwcX10wz0Dv+nW4TOVJFrggwWlurjyHrv8t7wQGp28Ddnw7U
	 J7Yrp/k1fdky+KL8VMhzN7O/C2LLoPo9JBKjsEzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AAECF804CA;
	Tue, 30 Jul 2019 16:10:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE6E2F804CA; Tue, 30 Jul 2019 16:10:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70DBAF800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 16:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70DBAF800BF
Received: from [167.98.27.226] (helo=[10.35.6.253])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hsSpF-0006wT-83; Tue, 30 Jul 2019 15:10:01 +0100
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-2-thomas.preston@codethink.co.uk>
 <20190730122748.GF54126@ediswmail.ad.cirrus.com>
From: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <16dff5b4-6a94-42de-85d4-0f4ec01fac8c@codethink.co.uk>
Date: Tue, 30 Jul 2019 15:10:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730122748.GF54126@ediswmail.ad.cirrus.com>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Patrick Glaser <pglaser@tesla.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Annaliese McDermond <nh6z@nh6z.net>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Duncan <rduncan@tesla.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Nate Case <ncase@tesla.com>, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH v2 1/3] dt-bindings: ASoC: Add TDA7802
 amplifier
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 30/07/2019 13:27, Charles Keepax wrote:
> On Tue, Jul 30, 2019 at 01:09:35PM +0100, Thomas Preston wrote:
>> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
>> Cc: Patrick Glaser <pglaser@tesla.com>
>> Cc: Rob Duncan <rduncan@tesla.com>
>> Cc: Nate Case <ncase@tesla.com>
>> ---
>>  .../devicetree/bindings/sound/tda7802.txt     | 26 +++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/tda7802.txt
>>
>> diff --git a/Documentation/devicetree/bindings/sound/tda7802.txt b/Documentation/devicetree/bindings/sound/tda7802.txt
>> new file mode 100644
>> index 000000000000..f80aaf4f1ba0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/tda7802.txt
>> @@ -0,0 +1,26 @@
>> +ST TDA7802 audio processor
>> +
>> +This device supports I2C only.
>> +
>> +Required properties:
>> +
>> +- compatible : "st,tda7802"
>> +- reg : the I2C address of the device
>> +- enable-supply : a regulator spec for the PLLen pin
>> +
>> +Optional properties:
>> +
>> +- st,gain-ch13 : gain for channels 1 and 3 (range: 1-4)
>> +- st,gain-ch24 : gain for channels 2 and 3 (range: 1-4)
> 
> I wouldn't have expected the gains to be available as a device
> tree setting.
> 

Ah, I forgot to update the docs from v1. Thanks
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
