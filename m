Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E10556B3716
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 08:08:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF2D517B7;
	Fri, 10 Mar 2023 08:07:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF2D517B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678432116;
	bh=fRVlA/oHWnBpIJsM5p241fEwlFs/wi5MvbKj6aoXhCg=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c39fMzhZZvVTgqmmp2xkeAJpAjqWqVs/fV+xlGVH5IduhOLGVi0XX7aqSD9hNatJh
	 UqdPO+yETx+4uj06EGgN78yvxKix8eefiXgo3El2VpW1qOpu5dHjcKsef258Is19yC
	 aVVYMBxauzPxfjzta+XD1zwk5A1gDBiiPHgcMM78=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B176F80236;
	Fri, 10 Mar 2023 08:07:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E289BF8042F; Fri, 10 Mar 2023 08:07:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bitmer.com (server-237-49.tentacle.cloud [185.179.237.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2AB6F8007E;
	Fri, 10 Mar 2023 08:07:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2AB6F8007E
Received: from jarkko by bitmer.com with local (Exim 4.92)
	(envelope-from <jarkko.nikula@bitmer.com>)
	id 1paWpw-0003gh-Gf; Fri, 10 Mar 2023 09:06:44 +0200
Date: Fri, 10 Mar 2023 09:06:44 +0200
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH] ASoC: do not include pm_runtime.h if not used
Message-ID: <20230310070644.GA13582@bitmer.com>
References: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Message-ID-Hash: S6GSAFPQBQORNEPX6JQB6ZPCUCQOXTYD
X-Message-ID-Hash: S6GSAFPQBQORNEPX6JQB6ZPCUCQOXTYD
X-MailFrom: jarkko.nikula@bitmer.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 oder_chiou@realtek.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 matthias.bgg@gmail.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 vkoul@kernel.org, daniel.baluta@nxp.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, sound-open-firmware@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S6GSAFPQBQORNEPX6JQB6ZPCUCQOXTYD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 07, 2023 at 12:30:22PM +0200, Claudiu Beznea wrote:
> Do not include pm_runtime.h header in files where runtime PM support is
> not implemented.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
...
>  sound/soc/ti/omap-mcbsp-st.c                              | 1 -
>  36 files changed, 37 deletions(-)

Looks like header was copied by accident from omap-mcbsp.c when sidetone
functionality was split into this new file.

Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
