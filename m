Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C17E86352E
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 13:49:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34B141667;
	Tue,  9 Jul 2019 13:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34B141667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562672948;
	bh=VueznRmHLU/g4L6I554b3RingTuRwi6Mjocu7O74RS0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KKyt3wQ1S111qguKs2eev3/xFO4QCP4VTSl4b1ESWxdo+H5otTNLEf+UHhraCSoz/
	 u5uFfQ3D8I4a7+84CMvCdsZeusfbF57fpaDfBZ3ei2mRmDYLCp6Y1S9k4Zc7bOOv2A
	 bv9CsU8E/sPwnxYgYlS3qhpw5eGgouC1gphmloe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FC50F800E2;
	Tue,  9 Jul 2019 13:47:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81259F80274; Tue,  9 Jul 2019 13:47:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54C2BF800E2
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 13:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54C2BF800E2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jul 2019 04:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="167964894"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [172.28.182.92])
 ([172.28.182.92])
 by orsmga003.jf.intel.com with ESMTP; 09 Jul 2019 04:47:10 -0700
To: Cheng-Yi Chiang <cychiang@chromium.org>
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-2-cychiang@chromium.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <3d5755cf-34e9-44f7-3b03-6bdfca84ff95@intel.com>
Date: Tue, 9 Jul 2019 13:47:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705042623.129541-2-cychiang@chromium.org>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 dgreid@chromium.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: hdmi-codec: Add an op to set
 callback function for plug event
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

On 2019-07-05 06:26, Cheng-Yi Chiang wrote:
> +static void hdmi_codec_jack_report(struct hdmi_codec_priv *hcp,
> +				   unsigned int jack_status)
> +{
> +	if (!hcp->jack)
> +		return;
> +
> +	if (jack_status != hcp->jack_status) {
> +		snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_LINEOUT);
> +		hcp->jack_status = jack_status;
> +	}
> +}

Single "if" statement instead? The first "if" does not even cover all 
cases - if the secondary check fails, you'll "return;" too.

> +/**
> + * hdmi_codec_set_jack_detect - register HDMI plugged callback
> + * @component: the hdmi-codec instance
> + * @jack: ASoC jack to report (dis)connection events on
> + */
> +int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
> +			       struct snd_soc_jack *jack)
> +{
> +	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	if (hcp->hcd.ops->hook_plugged_cb) {
> +		hcp->jack = jack;
> +		ret = hcp->hcd.ops->hook_plugged_cb(component->dev->parent,
> +						    hcp->hcd.data,
> +						    plugged_cb);
> +		if (ret) {
> +			hcp->jack = NULL;
> +			return ret;
> +		}
> +		return 0;
> +	}
> +	return -EOPNOTSUPP;
> +}
> +EXPORT_SYMBOL_GPL(hdmi_codec_set_jack_detect);

int ret = -EOPNOTSUPP;
(...)

return ret;

In consequence, you can reduce the number of "return(s)" and also remove 
the redundant parenthesis for the if-statement used to set jack to NULL.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
