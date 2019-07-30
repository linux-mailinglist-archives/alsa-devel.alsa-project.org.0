Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0137AA86
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 16:06:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA16B17C4;
	Tue, 30 Jul 2019 16:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA16B17C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564495586;
	bh=sHtlktSmwbh2Ywn3lVGgrZrB8n7Cjg9xzI74r3f9koo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qulGUopEqBwZ4IEQ4LSDdE7GMilSOvIucpA3CxqF7SMuDdqcSgyTnVisOhhqEFy9U
	 7hf9b6pX88b4KPMKD+sbX5uH57W6YdcXhT88BrslNGr2F4adoTIwRA0nEpK13I0SPR
	 2D1TXK5NdrXIXuK5wmFA0kkwmPqb2X69A9OzRDWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2675F804CC;
	Tue, 30 Jul 2019 16:04:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA90EF804CA; Tue, 30 Jul 2019 16:04:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=PRX_BODYSUB_1,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69C2EF80214
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 16:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69C2EF80214
Received: from [167.98.27.226] (helo=[10.35.6.253])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hsSjk-0006nP-P6; Tue, 30 Jul 2019 15:04:20 +0100
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-4-thomas.preston@codethink.co.uk>
 <20190730124158.GH54126@ediswmail.ad.cirrus.com>
From: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <e7a879d3-36c2-2df8-97c0-3c4bbd2e7ea2@codethink.co.uk>
Date: Tue, 30 Jul 2019 15:04:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730124158.GH54126@ediswmail.ad.cirrus.com>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Annaliese McDermond <nh6z@nh6z.net>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH v2 3/3] ASoC: TDA7802: Add turn-on
 diagnostic routine
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

Hi,
Thanks for getting back to me so quickly.

On 30/07/2019 13:41, Charles Keepax wrote:
> On Tue, Jul 30, 2019 at 01:09:37PM +0100, Thomas Preston wrote:
>> Add a debugfs device node which initiates the turn-on diagnostic routine
>> feature of the TDA7802 amplifier. The four status registers (one per
>> channel) are returned.
>>
>> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
>> ---
>> Changes since v1:
>> - Rename speaker-test to (turn-on) diagnostics
>> - Move turn-on diagnostic to debugfs as there is no standard ALSA
>>   interface for this kind of routine.
>>
>>  sound/soc/codecs/tda7802.c | 186 ++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 185 insertions(+), 1 deletion(-)
>>
>> +static int tda7802_bulk_update(struct regmap *map, struct reg_update *update,
>> +		size_t update_count)
>> +{
>> +	int i, err;
>> +
>> +	for (i = 0; i < update_count; i++) {
>> +		err = regmap_update_bits(map, update[i].reg, update[i].mask,
>> +				update[i].val);
>> +		if (err < 0)
>> +			return err;
>> +	}
>> +
>> +	return i;
>> +}
> 
> This could probably be removed using regmap_multi_reg_write.
> 

The problem is that I want to retain the state of the other bits in those
registers. Maybe I should make a copy of the backed up state, set the bits
I want to off-device, then either:

1. Write the changes with regmap_multi_reg_write
2. Write all six regs again (if my device doesn't support the multi_reg)

>> +static int tda7802_probe(struct snd_soc_component *component)
>> +{
>> +	struct tda7802_priv *tda7802 = snd_soc_component_get_drvdata(component);
>> +	struct device *dev = &tda7802->i2c->dev;
>> +	int err;
>> +
>> +	tda7802->debugfs = debugfs_create_dir(dev_name(dev), NULL);
>> +	if (IS_ERR_OR_NULL(tda7802->debugfs)) {
>> +		dev_info(dev,
>> +			"Failed to create debugfs node, err %ld\n",
>> +			PTR_ERR(tda7802->debugfs));
>> +		return 0;
>> +	}
>> +
>> +	mutex_init(&tda7802->diagnostic_mutex);
>> +	err = debugfs_create_file("diagnostic", 0444, tda7802->debugfs, tda7802,
>> +			&tda7802_diagnostic_fops);
>> +	if (err < 0) {
>> +		dev_err(dev,
>> +			"debugfs: Failed to create diagnostic node, err %d\n",
>> +			err);
>> +		goto cleanup_diagnostic;
>> +	}
> 
> You shouldn't be failing the driver probe if debugfs fails, it
> should be purely optional.
> 

Got it, thanks.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
