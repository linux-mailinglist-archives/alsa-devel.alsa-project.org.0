Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49452A32AA0
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2025 16:51:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DCA060268;
	Wed, 12 Feb 2025 16:51:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DCA060268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739375503;
	bh=veRJ1seuG5meNk+CJnoyOMvxRECby9IaNKYibL9rsv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nxsxUnj0dXlH32h9UwXHLPN7ayPkAf97WE+lUBuUPeq6YTs2njGybZ5Dw4iuSff/X
	 cFxEHfQt2z1fzoshe6nichm+OrQ4uX6d0n0PHRNoIT6hy426U5vFhZz2q/fFB6oHjK
	 mzzS2swXzyVp4n8VhtMCELPWupFxHJd/gHEiJxes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39584F805BB; Wed, 12 Feb 2025 16:51:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBE9DF805BD;
	Wed, 12 Feb 2025 16:51:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 257FDF80134; Wed, 12 Feb 2025 16:51:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C92ABF80134
	for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2025 16:51:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C92ABF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=URfurnxK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95260A40118;
	Wed, 12 Feb 2025 15:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EE5C4AF0B;
	Wed, 12 Feb 2025 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739375458;
	bh=veRJ1seuG5meNk+CJnoyOMvxRECby9IaNKYibL9rsv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=URfurnxKnHDqT67NaXeF+MY87//DBPNEdgtMNSbHJuEcs2WqelZJAMtNB2a7ExU3R
	 qNYbQaQH4EXETek/dstSEgt8j8HVHlX3VGNiv3f55CHQM6nvHpMKqdnZiZr39oPXUj
	 okfs6CO8CLUMyPiPLBzo+rU8ouluHvfaJdBM/aun3YMNEorHsyDPUVk9OTp1nVv+s5
	 hnIkBcqy8Ljx+z7bcLIDvwwE+jdBqmB4lu9wYSXb6GU+2pv6d3fhKh1eG34RodGRV0
	 V2acr5V1TiHFPzw0sCLhkCcpaxrDduHi7b6jaq1dcs3B6TK2Quh+5YEqLvXQiXzlOl
	 2Dmt7EuKcWo4g==
Date: Wed, 12 Feb 2025 15:50:50 +0000
From: Lee Jones <lee@kernel.org>
To: Fred Treven <ftreven@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Jeff LaBundy <jeff@labundy.com>, Heiko Stuebner <heiko@sntech.de>,
	Karel Balej <balejk@matfyz.cz>,
	Igor Prusov <ivprusov@salutedevices.com>,
	Jack Yu <jack.yu@realtek.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Paul Handrigan <paulha@opensource.cirrus.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nuno Sa <nuno.sa@analog.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RESEND 5/7] mfd: cs40l26: Add support for CS40L26 core
 driver
Message-ID: <20250212155050.GC2274105@google.com>
References: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
 <20250204231835.2000457-6-ftreven@opensource.cirrus.com>
 <4e5f0194-22bc-4e17-85f4-6dbc145a936b@kernel.org>
 <3bff0ff8-7397-414d-a701-011d5b5a41f4@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bff0ff8-7397-414d-a701-011d5b5a41f4@opensource.cirrus.com>
Message-ID-Hash: EOFT3OPPXVDOOIGINLJBYRFVZOJY4DYR
X-Message-ID-Hash: EOFT3OPPXVDOOIGINLJBYRFVZOJY4DYR
X-MailFrom: lee@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EOFT3OPPXVDOOIGINLJBYRFVZOJY4DYR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 11 Feb 2025, Fred Treven wrote:

> On 2/5/25 04:34, Krzysztof Kozlowski wrote:
> > On 05/02/2025 00:18, Fred Treven wrote:
> > > Introduce support for Cirrus Logic Device CS40L26:
> > > A boosted haptic driver with integrated DSP and
> > > waveform memory with advanced closed loop algorithms
> > > and LRA protection.
> > > 
> > Please wrap commit message according to Linux coding style / submission
> > process (neither too early nor over the limit):
> > https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> > 
> > 
> > > +
> > > +#include <linux/cleanup.h>
> > > +#include <linux/mfd/core.h>
> > > +#include <linux/mfd/cs40l26.h>
> > > +#include <linux/property.h>
> > > +#include <linux/regulator/consumer.h>
> > > +
> > > +static const struct mfd_cell cs40l26_devs[] = {
> > > +	{ .name = "cs40l26-codec", },
> > > +	{ .name = "cs40l26-vibra", },
> > > +};
> > > +
> > > +const struct regmap_config cs40l26_regmap = {
> > > +	.reg_bits = 32,
> > > +	.val_bits = 32,
> > > +	.reg_stride = 4,
> > > +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> > > +	.val_format_endian = REGMAP_ENDIAN_BIG,
> > > +	.max_register = CS40L26_LASTREG,
> > > +	.cache_type = REGCACHE_NONE,
> > > +};
> > > +EXPORT_SYMBOL_GPL(cs40l26_regmap);
> > > +
> > > +static const char *const cs40l26_supplies[] = {
> > > +	"va", "vp",
> > > +};
> > > +
> > > +inline void cs40l26_pm_exit(struct device *dev)
> > 
> > Exported function and inlined? This feels odd. Anyway, don't use any
> > inline keywords in C units.
> > 
> > > +{
> > > +	pm_runtime_mark_last_busy(dev);
> > > +	pm_runtime_put_autosuspend(dev);
> > > +}
> > > +EXPORT_SYMBOL_GPL(cs40l26_pm_exit);
> > > +
> > > +static int cs40l26_fw_write_raw(struct cs_dsp *dsp, const char *const name,
> > > +				const unsigned int algo_id, const u32 offset_words,
> > > +				const size_t len_words, u32 *buf)
> > > +{
> > > +	struct cs_dsp_coeff_ctl *ctl;
> > > +	__be32 *val;
> > > +	int i, ret;
> > > +
> > > +	ctl = cs_dsp_get_ctl(dsp, name, WMFW_ADSP2_XM, algo_id);
> > > +	if (!ctl) {
> > > +		dev_err(dsp->dev, "Failed to find FW control %s\n", name);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	val = kzalloc(len_words * sizeof(u32), GFP_KERNEL);
> > 
> > Looks like an array, so kcalloc
> > 
> > > +	if (!val)
> > > +		return -ENOMEM;
> > > +
> > > +	for (i = 0; i < len_words; i++)
> > > +		val[i] = cpu_to_be32(buf[i]);
> > > +
> > > +	ret = cs_dsp_coeff_write_ctrl(ctl, offset_words, val, len_words * sizeof(u32));
> > > +	if (ret < 0)
> > > +		dev_err(dsp->dev, "Failed to write FW control %s\n", name);
> > > +
> > > +	kfree(val);
> > > +
> > > +	return (ret < 0) ? ret : 0;
> > > +}
> > > +
> > > +inline int cs40l26_fw_write(struct cs_dsp *dsp, const char *const name, const unsigned int algo_id,
> > > +			    u32 val)
> > > +{
> > > +	return cs40l26_fw_write_raw(dsp, name, algo_id, 0, 1, &val);
> > > +}
> > > +EXPORT_SYMBOL_GPL(cs40l26_fw_write);
> > > +
> > > +static int cs40l26_fw_read_raw(struct cs_dsp *dsp, const char *const name,
> > > +			       const unsigned int algo_id, const unsigned int offset_words,
> > > +			       const size_t len_words, u32 *buf)
> > > +{
> > > +	struct cs_dsp_coeff_ctl *ctl;
> > > +	int i, ret;
> > > +
> > > +	ctl = cs_dsp_get_ctl(dsp, name, WMFW_ADSP2_XM, algo_id);
> > > +	if (!ctl) {
> > > +		dev_err(dsp->dev, "Failed to find FW control %s\n", name);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ret = cs_dsp_coeff_read_ctrl(ctl, offset_words, buf, len_words * sizeof(u32));
> > > +	if (ret) {
> > > +		dev_err(dsp->dev, "Failed to read FW control %s\n", name);
> > > +		return ret;
> > > +	}
> > > +
> > > +	for (i = 0; i < len_words; i++)
> > > +		buf[i] = be32_to_cpu(buf[i]);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +inline int cs40l26_fw_read(struct cs_dsp *dsp, const char *const name, const unsigned int algo_id,
> > 
> > All your exported functions should have kerneldoc.
> 
> I'm happy to add this, but I don't know where this directive comes from.
> Could you share where in the kernel style guide (or elsewhere) this is stated?
> There are also hundreds of examples in MFD in which exported functions
> do not have kerneldoc which is why I'm curious.
> 
> > 
> > > +			   u32 *buf)
> > > +{
> > > +	return cs40l26_fw_read_raw(dsp, name, algo_id, 0, 1, buf);
> > > +}
> > > +EXPORT_SYMBOL_GPL(cs40l26_fw_read);
> > > +
> > > +static struct cs40l26_irq *cs40l26_get_irq(struct cs40l26 *cs40l26, const int num, const int bit);
> > > +
> > > +static int cs40l26_gpio1_rise_irq(void *data)
> > > +{
> > > +	struct cs40l26 *cs40l26 = data;
> > > +
> > > +	if (cs40l26->wksrc_sts & CS40L26_WKSRC_STS_EN)
> > > +		dev_dbg(cs40l26->dev, "GPIO1 Rising Edge Detected\n");
> > > +
> > > +	cs40l26->wksrc_sts |= CS40L26_WKSRC_STS_EN;
> > > +
> > > +	return 0;
> > > +}
> > 
> > 
> > ...
> > 
> > > +err:
> > > +	dev_err(cs40l26->dev, "Invalid revision 0x%02X for device 0x%06X\n", cs40l26->revid,
> > > +		cs40l26->devid);
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +int cs40l26_set_pll_loop(struct cs40l26 *cs40l26, const u32 pll_loop)
> > > +{
> > > +	int i;
> > > +
> > > +	/* Retry in case DSP is hibernating */
> > > +	for (i = 0; i < CS40L26_PLL_NUM_SET_ATTEMPTS; i++) {
> > > +		if (!regmap_update_bits(cs40l26->regmap, CS40L26_REFCLK_INPUT,
> > > +					CS40L26_PLL_REFCLK_LOOP_MASK,
> > > +					pll_loop << CS40L26_PLL_REFCLK_LOOP_SHIFT))
> > > +			break;
> > > +	}
> > > +
> > > +	if (i == CS40L26_PLL_NUM_SET_ATTEMPTS) {
> > > +		dev_err(cs40l26->dev, "Failed to configure PLL\n");
> > > +		return -ETIMEDOUT;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(cs40l26_set_pll_loop);
> > > +
> > 
> > This looks way past simple MFD driver. Not only this - entire file. You
> > configure there quite a lot and for example setting PLLs is not job for
> > MFD. This should be placed in appropriate subsystem.
> > 
> I disagree here because the configuration being done in this file
> is essential to the core operation of the part. For instance,
> setting the PLL to open-loop here is required to prevent any
> external interference (e.g. GPIO events) from interrupting
> the part while loading firmware.
> 
> The other hardware configuration being done here is required for
> both the Input and ASoC operations of the part.
> 
> Lastly, these need to be done in order and independently of which
> child driver (ASoC or input) the user adds. If this is moved
> to cs40l26-vibra.c (the input driver), for instance,
> and that module is then not added, it will disturb the
> required setup for use by the ASoC driver.
> 
> I would really like to get Lee's opinion here because it does not
> make sense to me why this is inappropriate when the configuration
> done in the core MFD driver is required for use by all of its
> children.

FWIW, I agree with Krzysztof.

There's a bunch of functionality in here that should be exported out to
leaf drivers which should reside in their associated subsystems.  From
just a quick glance that looks to include, but not necessary limited
to; IRQs, GPIOs and PLLs (Clocks).

MFD has been used for a dumping ground under the premise of "core
functionality" before.  Tolerance for those arguments are now fairly
low.

-- 
Lee Jones [李琼斯]
