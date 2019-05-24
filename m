Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0063729B3A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 17:36:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B8821716;
	Fri, 24 May 2019 17:35:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B8821716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558712192;
	bh=Vz0XJBQUG0dy4QjJBIWKv6eqexN+nsyM2UVfbRzOATU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PtmBHuAjU2d0x1X0gTMy6ieejXcvhp57P8g7nXCbIkQhXJF8ujJez90Pcr6qVUJ3k
	 8AkmO2a40R4WbF2D0Z7ChJDi6DlwZhjI4QyQ1dCjjVqHjCt6QOYw2n/uC1hq4zWvUA
	 hTjpUXCYPgK468X9c/rgVESBw9TqAqq3aMoZeah8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACBC0F89673;
	Fri, 24 May 2019 17:34:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7C4EF89630; Fri, 24 May 2019 17:31:52 +0200 (CEST)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB2CFF806F7
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 17:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB2CFF806F7
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4OFJtdr011389; Fri, 24 May 2019 10:21:39 -0500
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=rf@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0b-001ae601.pphosted.com with ESMTP id 2sjefn117x-1;
 Fri, 24 May 2019 10:21:39 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
 by mail1.cirrus.com (Postfix) with ESMTP id 9F1A7611C8D4;
 Fri, 24 May 2019 10:21:38 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 24 May
 2019 16:21:38 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Fri, 24 May 2019 16:21:38 +0100
Received: from [198.90.251.142] (edi-sw-dsktp006.ad.cirrus.com
 [198.90.251.142])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D291D2A1;
 Fri, 24 May 2019 16:21:37 +0100 (BST)
To: Mark Brown <broonie@kernel.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>
References: <20190524104158.30731-1-ckeepax@opensource.cirrus.com>
 <20190524104158.30731-2-ckeepax@opensource.cirrus.com>
 <20190524145603.GE2456@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <2f4ab4ff-5b1e-8ef5-3ef7-8dfe413b4b95@opensource.cirrus.com>
Date: Fri, 24 May 2019 16:21:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190524145603.GE2456@sirena.org.uk>
Content-Language: en-US
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905240101
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, lee.jones@linaro.org
Subject: Re: [alsa-devel] [PATCH 2/5] ASoC: madera: Add common support for
 Cirrus Logic Madera codecs
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

On 24/05/19 15:56, Mark Brown wrote:
> On Fri, May 24, 2019 at 11:41:55AM +0100, Charles Keepax wrote:
> 
>> +	/*
>> +	 * Just read a register a few times to ensure the internal
>> +	 * oscillator sends out a few clocks.
>> +	 */
>> +	for (i = 0; i < 4; i++) {
>> +		ret = regmap_read(madera->regmap, MADERA_SOFTWARE_RESET, &val);
>> +		if (ret)
>> +			dev_err(madera->dev,
>> +				"%s Failed to read register: %d (%d)\n",
>> +				__func__, ret, i);
> 
> Why use %s to format the __func__ rather than just concatenate?

GCC docs say that it's a magic variable so cannot be concatenated with string literals. Though I
never tried concatenation to see if it works.

> 
>> +	}
>> +
>> +	udelay(300);
> 
> So we read the register a few times then add a few hundred us of delay
> after?  Surely that delay is going to be negligable compared to the time
> spent on I/O?

The register reads are to create clock cycles in the silicon, not to generate delay.

> 
>> +int madera_sysclk_ev(struct snd_soc_dapm_widget *w,
>> +		     struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>> +	struct madera_priv *priv = snd_soc_component_get_drvdata(component);
>> +
>> +	madera_spin_sysclk(priv);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(madera_sysclk_ev);
> 
> This will delay both before and after every power up and power down.
> Are you sure that makes sense?
>

I think that's correct but we can re-check with hardware people. It's not just a delay,
it needs to ensure there are always a certain number of SYSCLK cycles in the hardware to
avoid leaving certain state machines in limbo.

>> +
>> +	ret = madera_check_speaker_overheat(madera, &warn, &shutdown);
>> +	if (ret)
>> +		shutdown = true; /* for safety attempt to shutdown on error */
>> +
>> +	if (shutdown) {
>> +		dev_crit(madera->dev, "Thermal shutdown\n");
>> +		ret = regmap_update_bits(madera->regmap,
>> +					 MADERA_OUTPUT_ENABLES_1,
>> +					 MADERA_OUT4L_ENA |
>> +					 MADERA_OUT4R_ENA, 0);
>> +		if (ret != 0)
>> +			dev_crit(madera->dev,
>> +				 "Failed to disable speaker outputs: %d\n",
>> +				 ret);
>> +	} else if (warn) {
>> +		dev_crit(madera->dev, "Thermal warning\n");
>> +	}
>> +
>> +	return IRQ_HANDLED;
> 
> We will flag the interrupt as handled if there was neither a warning nor
> a critical overheat?  I'd expect some warning about a spurious interrupt
> at least.
> 
>> +static int madera_get_variable_u32_array(struct madera_priv *priv,
>> +					 const char *propname,
>> +					 u32 *dest,
>> +					 int n_max,
>> +					 int multiple)
>> +{
>> +	struct madera *madera = priv->madera;
>> +	int n, ret;
>> +
>> +	n = device_property_read_u32_array(madera->dev, propname, NULL, 0);
>> +	if (n == -EINVAL) {
>> +		return 0;	/* missing, ignore */
>> +	} else if (n < 0) {
>> +		dev_warn(madera->dev, "%s malformed (%d)\n",
>> +			 propname, n);
>> +		return n;
>> +	} else if ((n % multiple) != 0) {
>> +		dev_warn(madera->dev, "%s not a multiple of %d entries\n",
>> +			 propname, multiple);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (n > n_max)
>> +		n = n_max;
>> +
>> +	ret = device_property_read_u32_array(madera->dev, propname, dest, n);
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +	else
>> +		return n;
>> +}
> 
> This feels like it should perhaps be a generic OF helper function -
> there's nothing driver specific I'm seeing here and arrays that need to
> be a multiple of N entries aren't that uncommon I think.
> 
>> +	mutex_lock(&priv->rate_lock);
>> +	cached_rate = priv->adsp_rate_cache[adsp_num];
>> +	mutex_unlock(&priv->rate_lock);
> 
> What's this lock protecting?  The value can we read can change as soon
> as the lock is released and we're just reading a single word here rather
> than traversing a data structure that might change under us or
> something.
> 
>> +void madera_destroy_bus_error_irq(struct madera_priv *priv, int dsp_num)
>> +{
>> +	struct madera *madera = priv->madera;
>> +
>> +	madera_free_irq(madera,
>> +			madera_dsp_bus_error_irqs[dsp_num],
>> +			&priv->adsp[dsp_num]);
>> +}
>> +EXPORT_SYMBOL_GPL(madera_destroy_bus_error_irq);
> 
> We use free rather than destroy normally?
> 
>> +static const char * const madera_dfc_width_text[MADERA_DFC_WIDTH_ENUM_SIZE] = {
>> +	"8bit", "16bit", "20bit", "24bit", "32bit",
>> +};
> 
> Spaces might make these more readable.
> 
>> +static void madera_sleep(unsigned int delay)
>> +{
>> +	if (delay < 20) {
>> +		delay *= 1000;
>> +		usleep_range(delay, delay + 500);
>> +	} else {
>> +		msleep(delay);
>> +	}
>> +}
> 
> This feels like it might make sense as a helper function as well - I
> could've sworn there was one already but I can't immediately find it.
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
