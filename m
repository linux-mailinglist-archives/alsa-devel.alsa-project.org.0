Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA0029B2B
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 17:35:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23D6716E5;
	Fri, 24 May 2019 17:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23D6716E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558712152;
	bh=ZNVcJksszd3xtbhOfeXgIYVxB+h+OZyYHDfBc74J1z4=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rs/yo/RUnlBdd2GektwaFtuf7DAouifFhvq6Q4JsQCDg6Wwbm22PQk2SVI4RQ3xZf
	 3XPc6+BFUsCzK8aI8f9K8fi1jZoghudzt1KlaqQPVTyB8dbsr9kTcO4K0F1FZHsDEx
	 xF3m2OOhm42RBbxtSm9nnfYc3gjP3/vw0sdSEZ8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4527F8963E;
	Fri, 24 May 2019 17:34:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 112B8F8962F; Fri, 24 May 2019 17:29:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21243F89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 17:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21243F89625
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4OFJqBs032263; Fri, 24 May 2019 10:24:12 -0500
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=rf@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
 by mx0a-001ae601.pphosted.com with ESMTP id 2sjff21c75-1;
 Fri, 24 May 2019 10:24:11 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
 by mail2.cirrus.com (Postfix) with ESMTP id 5DE61605A6A3;
 Fri, 24 May 2019 10:24:11 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 24 May
 2019 16:24:10 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Fri, 24 May 2019 16:24:10 +0100
Received: from [198.90.251.142] (edi-sw-dsktp006.ad.cirrus.com
 [198.90.251.142])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 986BC44;
 Fri, 24 May 2019 16:24:10 +0100 (BST)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>
References: <20190524104158.30731-1-ckeepax@opensource.cirrus.com>
 <20190524104158.30731-2-ckeepax@opensource.cirrus.com>
 <20190524145603.GE2456@sirena.org.uk>
 <2f4ab4ff-5b1e-8ef5-3ef7-8dfe413b4b95@opensource.cirrus.com>
Message-ID: <ae5eee88-0b79-1e58-5812-9e46e5bf3b75@opensource.cirrus.com>
Date: Fri, 24 May 2019 16:24:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <2f4ab4ff-5b1e-8ef5-3ef7-8dfe413b4b95@opensource.cirrus.com>
Content-Language: en-US
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 24/05/19 16:21, Richard Fitzgerald wrote:
> On 24/05/19 15:56, Mark Brown wrote:
>> On Fri, May 24, 2019 at 11:41:55AM +0100, Charles Keepax wrote:
>>
>>> +=A0=A0=A0 /*
>>> +=A0=A0=A0=A0 * Just read a register a few times to ensure the internal
>>> +=A0=A0=A0=A0 * oscillator sends out a few clocks.
>>> +=A0=A0=A0=A0 */
>>> +=A0=A0=A0 for (i =3D 0; i < 4; i++) {
>>> +=A0=A0=A0=A0=A0=A0=A0 ret =3D regmap_read(madera->regmap, MADERA_SOFTW=
ARE_RESET, &val);
>>> +=A0=A0=A0=A0=A0=A0=A0 if (ret)
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(madera->dev,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "%s Failed to read regis=
ter: %d (%d)\n",
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __func__, ret, i);
>>
>> Why use %s to format the __func__ rather than just concatenate?
> =

> GCC docs say that it's a magic variable so cannot be concatenated with st=
ring literals. Though I
> never tried concatenation to see if it works.
> =

>>
>>> +=A0=A0=A0 }
>>> +
>>> +=A0=A0=A0 udelay(300);
>>
>> So we read the register a few times then add a few hundred us of delay
>> after?=A0 Surely that delay is going to be negligable compared to the ti=
me
>> spent on I/O?
> =

> The register reads are to create clock cycles in the silicon, not to gene=
rate delay.
> =


Sorry, just re-read your comment and realized I'd misread it. It's a hardwa=
re requirement
that after generating the internal clocks there must be a delay. I.e. we re=
quire a combination
of a guaranteed number of SYSCLKs followed by a guaranteed minimum delay.

>>
>>> +int madera_sysclk_ev(struct snd_soc_dapm_widget *w,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct snd_kcontrol *kcontrol, in=
t event)
>>> +{
>>> +=A0=A0=A0 struct snd_soc_component *component =3D snd_soc_dapm_to_comp=
onent(w->dapm);
>>> +=A0=A0=A0 struct madera_priv *priv =3D snd_soc_component_get_drvdata(c=
omponent);
>>> +
>>> +=A0=A0=A0 madera_spin_sysclk(priv);
>>> +
>>> +=A0=A0=A0 return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(madera_sysclk_ev);
>>
>> This will delay both before and after every power up and power down.
>> Are you sure that makes sense?
>>
> =

> I think that's correct but we can re-check with hardware people. It's not=
 just a delay,
> it needs to ensure there are always a certain number of SYSCLK cycles in =
the hardware to
> avoid leaving certain state machines in limbo.
> =

>>> +
>>> +=A0=A0=A0 ret =3D madera_check_speaker_overheat(madera, &warn, &shutdo=
wn);
>>> +=A0=A0=A0 if (ret)
>>> +=A0=A0=A0=A0=A0=A0=A0 shutdown =3D true; /* for safety attempt to shut=
down on error */
>>> +
>>> +=A0=A0=A0 if (shutdown) {
>>> +=A0=A0=A0=A0=A0=A0=A0 dev_crit(madera->dev, "Thermal shutdown\n");
>>> +=A0=A0=A0=A0=A0=A0=A0 ret =3D regmap_update_bits(madera->regmap,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 MADERA_OU=
TPUT_ENABLES_1,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 MADERA_OU=
T4L_ENA |
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 MADERA_OU=
T4R_ENA, 0);
>>> +=A0=A0=A0=A0=A0=A0=A0 if (ret !=3D 0)
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_crit(madera->dev,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Failed to disable sp=
eaker outputs: %d\n",
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret);
>>> +=A0=A0=A0 } else if (warn) {
>>> +=A0=A0=A0=A0=A0=A0=A0 dev_crit(madera->dev, "Thermal warning\n");
>>> +=A0=A0=A0 }
>>> +
>>> +=A0=A0=A0 return IRQ_HANDLED;
>>
>> We will flag the interrupt as handled if there was neither a warning nor
>> a critical overheat?=A0 I'd expect some warning about a spurious interru=
pt
>> at least.
>>
>>> +static int madera_get_variable_u32_array(struct madera_priv *priv,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const cha=
r *propname,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 *dest,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int n_max,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int multi=
ple)
>>> +{
>>> +=A0=A0=A0 struct madera *madera =3D priv->madera;
>>> +=A0=A0=A0 int n, ret;
>>> +
>>> +=A0=A0=A0 n =3D device_property_read_u32_array(madera->dev, propname, =
NULL, 0);
>>> +=A0=A0=A0 if (n =3D=3D -EINVAL) {
>>> +=A0=A0=A0=A0=A0=A0=A0 return 0;=A0=A0=A0 /* missing, ignore */
>>> +=A0=A0=A0 } else if (n < 0) {
>>> +=A0=A0=A0=A0=A0=A0=A0 dev_warn(madera->dev, "%s malformed (%d)\n",
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 propname, n);
>>> +=A0=A0=A0=A0=A0=A0=A0 return n;
>>> +=A0=A0=A0 } else if ((n % multiple) !=3D 0) {
>>> +=A0=A0=A0=A0=A0=A0=A0 dev_warn(madera->dev, "%s not a multiple of %d e=
ntries\n",
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 propname, multiple);
>>> +=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
>>> +=A0=A0=A0 }
>>> +
>>> +=A0=A0=A0 if (n > n_max)
>>> +=A0=A0=A0=A0=A0=A0=A0 n =3D n_max;
>>> +
>>> +=A0=A0=A0 ret =3D device_property_read_u32_array(madera->dev, propname=
, dest, n);
>>> +
>>> +=A0=A0=A0 if (ret < 0)
>>> +=A0=A0=A0=A0=A0=A0=A0 return ret;
>>> +=A0=A0=A0 else
>>> +=A0=A0=A0=A0=A0=A0=A0 return n;
>>> +}
>>
>> This feels like it should perhaps be a generic OF helper function -
>> there's nothing driver specific I'm seeing here and arrays that need to
>> be a multiple of N entries aren't that uncommon I think.
>>
>>> +=A0=A0=A0 mutex_lock(&priv->rate_lock);
>>> +=A0=A0=A0 cached_rate =3D priv->adsp_rate_cache[adsp_num];
>>> +=A0=A0=A0 mutex_unlock(&priv->rate_lock);
>>
>> What's this lock protecting?=A0 The value can we read can change as soon
>> as the lock is released and we're just reading a single word here rather
>> than traversing a data structure that might change under us or
>> something.
>>
>>> +void madera_destroy_bus_error_irq(struct madera_priv *priv, int dsp_nu=
m)
>>> +{
>>> +=A0=A0=A0 struct madera *madera =3D priv->madera;
>>> +
>>> +=A0=A0=A0 madera_free_irq(madera,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 madera_dsp_bus_error_irqs[dsp_num],
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &priv->adsp[dsp_num]);
>>> +}
>>> +EXPORT_SYMBOL_GPL(madera_destroy_bus_error_irq);
>>
>> We use free rather than destroy normally?
>>
>>> +static const char * const madera_dfc_width_text[MADERA_DFC_WIDTH_ENUM_=
SIZE] =3D {
>>> +=A0=A0=A0 "8bit", "16bit", "20bit", "24bit", "32bit",
>>> +};
>>
>> Spaces might make these more readable.
>>
>>> +static void madera_sleep(unsigned int delay)
>>> +{
>>> +=A0=A0=A0 if (delay < 20) {
>>> +=A0=A0=A0=A0=A0=A0=A0 delay *=3D 1000;
>>> +=A0=A0=A0=A0=A0=A0=A0 usleep_range(delay, delay + 500);
>>> +=A0=A0=A0 } else {
>>> +=A0=A0=A0=A0=A0=A0=A0 msleep(delay);
>>> +=A0=A0=A0 }
>>> +}
>>
>> This feels like it might make sense as a helper function as well - I
>> could've sworn there was one already but I can't immediately find it.
>>
> =


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
