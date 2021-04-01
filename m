Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D7535100D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 09:24:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3A0B16B4;
	Thu,  1 Apr 2021 09:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3A0B16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617261882;
	bh=J709AUoNNYTejo2qFGwK4/6PgplsILaGpLmxycENUFM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rNl3QG3D0tlaSAKo1uTXyfbdtgEM3RXHRCgBfUCYSfshXTCGP4Vj0NMsMZpbMVnLp
	 sNH9b4gY4vtwW/cfZwi09m0ddx6CyKq2XX6y9YHLoYwjMFmANexHQ6g1T/55BHWc9r
	 JwpPmTevSVC3rOhYqndqx/JXZ5kyxqt+iBVTB0Co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58C1CF80240;
	Thu,  1 Apr 2021 09:23:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8613EF8026F; Thu,  1 Apr 2021 09:23:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8396F8013C
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 09:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8396F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Yl3QqHt0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46EBF6023C;
 Thu,  1 Apr 2021 07:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617261784;
 bh=J709AUoNNYTejo2qFGwK4/6PgplsILaGpLmxycENUFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yl3QqHt0VGFiJEHeSvxsHq86JpTpo5/0af2t5FhNqpzsvHgqdbsS+EXWRArF+53xQ
 ATGYc3aoAfDRy/8m/946DbHam5H+hlHdw9fDht0in934LvojraXlB8xW1DPyyZ/M6n
 4znVEh9Xn71D+36Sg/ot6/u6T4vB+HHHHPbHTzGW94LeEe35KKC22uxHDBgDAuaIEg
 hf9Kvz6AuEIwRPXAd7srfbunXUCAtWYruuzu+Sq2MWKlDhEN7/PVyw7pOg2/o2IICM
 NmwI0/UVk/+hyEZibRbk46rvj4bfhjo+S6gnZTsm10S3DHScqtxG3BgDGOW0gbALkI
 yO8hUyhMr7UJw==
Date: Thu, 1 Apr 2021 12:52:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 0/5] soundwire: add static port map support
Message-ID: <YGV009kiiArJsFMM@vkoul-mobl.Dlink>
References: <20210315165650.13392-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315165650.13392-1-srinivas.kandagatla@linaro.org>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org, sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 15-03-21, 16:56, Srinivas Kandagatla wrote:
> In some cases, SoundWire device ports are statically mapped to Controller
> ports during design, however there is no way to expose this information
> to the controller. Controllers like Qualcomm ones use this info to setup
> static bandwidth parameters for those ports.
> 
> A generic port allocation is not possible in this cases!
> This patch adds a new member m_port_map to SoundWire device so that
> it can populate the static master port map and share it with controller
> to be able to setup correct bandwidth parameters.
> 
> As a user of this feature this patchset also adds new bindings for
> wsa881x smart speaker which has 4 ports which are statically mapped
> to the 3 output and 1 input port of the controller.
> 
> Tested it on DB845c and SM8250 MTP.
> 
> thanks,
> srini
> 
> Changes since v3:
> 	- updated kernel doc for more clarity on m_port_map
> 
> Srinivas Kandagatla (5):
>   soundwire: add static port mapping support
>   soundwire: qcom: update port map allocation bit mask
>   soundwire: qcom: add static port map support

Applied all sdw patches, thanks

>   ASoC: dt-bindings: wsa881x: add bindings for port mapping
>   ASoC: codecs: wsa881x: add static port map support
> 
>  .../bindings/sound/qcom,wsa881x.yaml          |  9 ++++++
>  drivers/soundwire/qcom.c                      | 31 +++++++++++++++----
>  include/linux/soundwire/sdw.h                 |  2 ++
>  sound/soc/codecs/wsa881x.c                    |  7 +++++
>  4 files changed, 43 insertions(+), 6 deletions(-)
> 
> -- 
> 2.21.0

-- 
~Vinod
