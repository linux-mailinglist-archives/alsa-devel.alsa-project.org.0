Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE6E7AC60
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 17:28:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFE0E17BB;
	Tue, 30 Jul 2019 17:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFE0E17BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564500490;
	bh=n8DwLrPo1cYS/ihaSrYyy+wma+KbIxrc66yBMQHHeWM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rRdg5HtTK6fjQBxTNoRrJySz79VXUZTBtdxRmFnLbJI4/oHRtnvViS8DyEiAeR1bX
	 4P9bKI8vBsuP4DrbkyhPlACf/HInFVOpYmnYG+qoviNJEfuMk7Km9AV31mihkkQ3aE
	 SVFy1ePebyCRqob/48nsOsvVVwRERf7mwr5M7iUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4C72F800AB;
	Tue, 30 Jul 2019 17:26:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79E52F804CA; Tue, 30 Jul 2019 17:26:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B181F800AB
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 17:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B181F800AB
Received: from [167.98.27.226] (helo=[10.35.6.253])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hsU0k-0000og-32; Tue, 30 Jul 2019 16:25:58 +0100
To: Mark Brown <broonie@kernel.org>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-4-thomas.preston@codethink.co.uk>
 <20190730141935.GF4264@sirena.org.uk>
From: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <45156592-a90f-b4f8-4d30-9631c03f1280@codethink.co.uk>
Date: Tue, 30 Jul 2019 16:25:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730141935.GF4264@sirena.org.uk>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Annaliese McDermond <nh6z@nh6z.net>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On 30/07/2019 15:19, Mark Brown wrote:
> On Tue, Jul 30, 2019 at 01:09:37PM +0100, Thomas Preston wrote:
> 
>> +	struct dentry *debugfs;
>> +	struct mutex diagnostic_mutex;
>> +};
> 
> It is unclear what this mutex usefully protects, it only gets taken when
> writing to the debugfs file to trigger this diagnostic mode but doesn't
> do anything to control interactions with any other code path in the
> driver.
> 

If another process reads the debugfs node "diagnostic" while the turn-on 
diagnostic mode is running, this mutex prevents the second process
restarting the diagnostics.

This is redundant if debugfs reads are atomic, but I don't think they are.


>> +static int run_turn_on_diagnostic(struct tda7802_priv *tda7802, u8 *status)
>> +{
>> +	struct device *dev = &tda7802->i2c->dev;
>> +	int err_status, err;
>> +	unsigned int val;
>> +	u8 state[NUM_IB];
> 
>> +	/* We must wait 20ms for device to settle, otherwise diagnostics will
>> +	 * not start and regmap poll will timeout.
>> +	 */
>> +	msleep(DIAGNOSTIC_SETTLE_MS);
> 
> The comment and define might go out of sync...
> 

Thanks, I will remove the 20ms but keep the comment here.

>> +	err = regmap_bulk_read(tda7802->regmap, TDA7802_DB1, status, 4);
>> +	if (err < 0) {
>> +		dev_err(dev, "Could not read channel status, %d\n", err);
>> +		goto diagnostic_restore;
>> +	}
> 
> ...but here we use a magic number for the array size :(
> 

Thanks, will update.

>> +static int tda7802_diagnostic_show(struct seq_file *f, void *p)
>> +{
>> +	char *buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
> 
> We neither use nor free buf?
> 
>> +static int tda7802_probe(struct snd_soc_component *component)
>> +{
>> +	struct tda7802_priv *tda7802 = snd_soc_component_get_drvdata(component);
>> +	struct device *dev = &tda7802->i2c->dev;
>> +	int err;
> 
> Why is this done at the component level?
> 

Argh my bad, a previous iteration required the buf and component. I missed
this, sorry for the noise.

Thanks for feedback, I'll go back and tend to all of this.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
