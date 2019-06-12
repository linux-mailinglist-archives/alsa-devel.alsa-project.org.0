Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 971A842E2B
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:58:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35AEC17B7;
	Wed, 12 Jun 2019 19:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35AEC17B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560362298;
	bh=7dkNkym0fPG6ombGhaFURU4qcJQpQg0K5cvdfrwf22A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D6yFcBEa5/CPboHfsHUj0Z+2eCNDidtiNP67dqVYgi1pQ2yqVbQHVC9NQiSrTf5wx
	 ASgjGLHji41PfYOiaYX4NH97Y8pf40zg30QMI060ihGOyUQ/rvZBnLc05q2cQ0T3K1
	 j9IfUMElemmKtSMPrwZMgLOJ0Y0ynRuVkA82FDyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8888FF896E0;
	Wed, 12 Jun 2019 19:56:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74D55F896E0; Wed, 12 Jun 2019 19:56:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4081DF806F5
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4081DF806F5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:56:26 -0700
X-ExtLoop1: 1
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.15.160])
 ([10.252.15.160])
 by fmsmga004.fm.intel.com with ESMTP; 12 Jun 2019 10:56:17 -0700
To: Thomas Preston <thomas.preston@codethink.co.uk>
References: <20190611174909.12162-1-thomas.preston@codethink.co.uk>
 <20190611174909.12162-5-thomas.preston@codethink.co.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <607e83fb-3d37-cf05-ded5-4f582352bdb0@intel.com>
Date: Wed, 12 Jun 2019 19:56:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611174909.12162-5-thomas.preston@codethink.co.uk>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Marco Felsch <m.felsch@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH v1 4/4] ASoC: tda7802: Add speaker-test
	sysfs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019-06-11 19:49, Thomas Preston wrote:
> Add speaker_test device attribute. When the speaker-test node is read
> the hardware speaker test is started.
> 
> 	$ cat /sys/devices/.../device:00/speaker_test
> 	04 04 04 04
> 
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> Cc: Patrick Glaser <pglaser@tesla.com>
> Cc: Rob Duncan <rduncan@tesla.com>
> Cc: Nate Case <ncase@tesla.com>
> ---
>   sound/soc/codecs/tda7802.c | 172 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 172 insertions(+)
> 
> diff --git a/sound/soc/codecs/tda7802.c b/sound/soc/codecs/tda7802.c
> index 62aae011d9f1..edfa752c0c9f 100644
> --- a/sound/soc/codecs/tda7802.c
> +++ b/sound/soc/codecs/tda7802.c
> @@ -157,6 +157,7 @@ static const u8 IB3_FORMAT[4][4] = {
>   #define DUMP_NUM_REGS			   (DUMP_NUM_BLOCK * 2)
>   
>   struct tda7802_priv {
> +	struct mutex mutex;
>   	struct i2c_client *i2c;
>   	struct regmap *regmap;
>   	struct regulator *enable_reg;
> @@ -458,6 +459,159 @@ static struct snd_soc_dai_driver tda7802_dai_driver = {
>   	.ops = &tda7802_dai_ops,
>   };
>   
> +/* The speaker test is triggered by reading a sysfs attribute file attached to
> + * the I2C device. The user space thread that's doing the reading is blocked
> + * until the test completes (or times out). We only permit one test to be in
> + * progress at a time.
> + */
> +
> +static int speaker_test_start(struct regmap *regmap)
> +{
> +	int err;
> +
> +	err = regmap_update_bits(regmap, TDA7802_IB5, IB5_AMPLIFIER_ON, 0);
> +	if (err < 0) {
> +		dev_err(regmap_get_device(regmap),
> +			"Cannot disable amp for speaker test (%d)\n", err);
> +		return err;
> +	}
> +
> +	err = regmap_update_bits(regmap, TDA7802_IB4, IB4_DIAG_MODE_ENABLE, 0);
> +	if (err < 0) {
> +		dev_err(regmap_get_device(regmap),
> +			"Cannot disable diag mode before speaker test (%d)\n",
> +			err);
> +		return err;
> +	}
> +
> +	/* Seem to need at least a 15 ms delay here before the rising
> +	 * edge. Otherwise the diagnostics never complete (perhaps
> +	 * they never start).
> +	 */
> +	msleep(20);
> +
> +	err = regmap_update_bits(regmap, TDA7802_IB4,
> +				 IB4_DIAG_MODE_ENABLE, IB4_DIAG_MODE_ENABLE);
> +	if (err < 0) {
> +		dev_err(regmap_get_device(regmap),
> +			"Cannot enable diag mode for speaker test (%d)\n", err);
> +		return err;
> +	}
> +
> +	return 0;

You may want to follow path set by speaker_test_stop: replace "return 0" 
with "return err" and have only error msg found within preceding 
if-statement.

> +}
> +
> +static int speaker_test_stop(struct regmap *regmap)
> +{
> +	int err;
> +
> +	err = regmap_update_bits(regmap, TDA7802_IB4, IB4_DIAG_MODE_ENABLE, 0);
> +	if (err < 0)
> +		dev_err(regmap_get_device(regmap),
> +			"Cannot disable diag mode after speaker test (%d)\n",
> +			err);
> +	return err;
> +}
> +
> +/* We poll the test completion bit, letting the current thread sleep
> + * until we're done. These values are not critical.
> + */
> +#define SPEAKER_TEST_DONE_POLL_PERIOD_US 5000
> +#define SPEAKER_TEST_DONE_TIMEOUT_US	 5000000
> +
> +static int speaker_test_check(struct tda7802_priv *tda7802,
> +		unsigned int *status)
> +{
> +	struct regmap *regmap = tda7802->regmap;
> +	struct device *dev = &tda7802->i2c->dev;
> +	int reg_err = 0, err = 0, i, amp_on;

Both reg_err and err are initialized unnecessarily.

> +	unsigned int val;
> +
> +	reg_err = regulator_enable(tda7802->enable_reg);
> +	if (reg_err < 0) {
> +		dev_err(dev, "Could not enable (speaker-test).\n");
> +		return reg_err;
> +	}
> +	msleep(ENABLE_DELAY_MS);
> +
> +	/* we should return amp on state when speaker-test is done */
> +	err = regmap_read(regmap, TDA7802_IB5, &amp_on);
> +	if (err < 0) {
> +		dev_err(dev, "Could not read amp on state (speaker-test)\n");
> +		goto speaker_test_disable;
> +	}
> +
> +	for (i = 0; i < CHANNELS_PER_AMP; ++i)
> +		status[i] = 0xff;
> +
> +	err = speaker_test_start(regmap);
> +	if (err < 0)
> +		goto speaker_test_restore;
> +
> +	/* Wait until DB0_STARTUP_DIAG_STATUS is set */
> +	err = regmap_read_poll_timeout(regmap, TDA7802_DB0, val,
> +			val & DB0_STARTUP_DIAG_STATUS,
> +			SPEAKER_TEST_DONE_POLL_PERIOD_US,
> +			SPEAKER_TEST_DONE_TIMEOUT_US);
> +	if (err < 0) {
> +		if (err == -ENODATA)
> +			dev_err(dev,
> +				"Speaker diagnostic test did not complete\n");
> +		speaker_test_stop(regmap);
> +		goto speaker_test_restore;
> +	}
> +
> +	err = speaker_test_stop(regmap);
> +	if (err < 0)
> +		goto speaker_test_restore;

This sequence looks weird and as if it could be simplified but I might 
be just plain wrong. speaker_test_stop gets invoked whether or not 
regmap_read_poll_timeout fails, though only in "happy" path its return 
is account for. If it's not too much to ask, could you clarify?

> +
> +	for (i = 0; i < CHANNELS_PER_AMP; ++i) {
> +		err = regmap_read(regmap, TDA7802_DB1 + i, status + i);
> +		if (err < 0) {
> +			dev_err(dev,
> +				"Cannot get speaker %d status (%d)\n", i, err);
> +			goto speaker_test_restore;
> +		}
> +	}
> +
> +speaker_test_restore:
> +	err = regmap_update_bits(regmap, TDA7802_IB5, IB5_AMPLIFIER_ON,
> +			amp_on);
> +	if (err < 0)
> +		dev_err(dev, "Could not restore amp on state (speaker-test)\n");
> +
> +speaker_test_disable:
> +	reg_err = regulator_disable(tda7802->enable_reg);
> +	if (reg_err < 0) {
> +		dev_err(dev, "Could not disable (speaker-test).\n");
> +		return reg_err;
> +	}
> +	return err;
> +}
> +
> +static ssize_t speaker_test_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct tda7802_priv *tda7802 = dev_get_drvdata(dev);
> +	unsigned int channel_status[CHANNELS_PER_AMP];
> +	char *str = buf;
> +	int ret, i;
> +
> +	mutex_lock(&tda7802->mutex);
> +	ret = speaker_test_check(tda7802, channel_status);
> +	mutex_unlock(&tda7802->mutex);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < CHANNELS_PER_AMP; i++)
> +		str += sprintf(str, "%02x ", channel_status[i]);
> +	str += sprintf(str, "\n");
> +
> +	return str - buf;
> +}
> +
> +static DEVICE_ATTR_RO(speaker_test);
> +
>   static ssize_t enable_show(struct device *dev, struct device_attribute *attr,
>   		char *buf)
>   {
> @@ -537,12 +691,28 @@ static int tda7802_probe(struct snd_soc_component *component)
>   
>   	dev_dbg(dev, "%s\n", __func__);
>   
> +	/* Device is ready, now we should create sysfs attributes.
> +	 * Rememer to cleanup
> +	 */
>   	err = device_create_file(dev, &dev_attr_enable);
>   	if (err < 0) {
>   		dev_err(dev, "Could not create enable attr\n");
>   		return err;
>   	}
>   
> +	mutex_init(&tda7802->mutex);
> +	err = device_create_file(dev, &dev_attr_speaker_test);
> +	if (err < 0) {
> +		dev_err(dev, "Could not create speaker_test attr\n");
> +		goto cleanup_speaker_test;
> +	}
> +
> +	return 0;
> +
> +cleanup_speaker_test:
> +	mutex_destroy(&tda7802->mutex);
> +	device_remove_file(&tda7802->i2c->dev, &dev_attr_enable);
> +
>   	return err;
>   }
>   
> @@ -550,6 +720,8 @@ static void tda7802_remove(struct snd_soc_component *component)
>   {
>   	struct tda7802_priv *tda7802 = snd_soc_component_get_drvdata(component);
>   
> +	device_remove_file(&tda7802->i2c->dev, &dev_attr_speaker_test);
> +	mutex_destroy(&tda7802->mutex);
>   	device_remove_file(&tda7802->i2c->dev, &dev_attr_enable);
>   }
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
