Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D62B981B9D0
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 15:46:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EB5EDF0;
	Thu, 21 Dec 2023 15:46:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EB5EDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703169993;
	bh=9rUMqr3K4HJZTAFenjHNt1RV6itpPVxCJDKk8eXJ70Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ssBwM7ZB08qja/BS+pXlnsuTNblP33TEcVxOR+FLPShwjNWy0N+d2dqNGMsXyhHZT
	 nfmzIM8d4cfDVPoSerWG65s7D5qu4ZPaKvymDjJKUX3nkOl83fJ1j4Ps5+fn4I6Zjr
	 yPmv3JEURXddq3U+yqmdle9mjoddhktOgmxnXjfw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E90BF80579; Thu, 21 Dec 2023 15:46:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 020ECF80578;
	Thu, 21 Dec 2023 15:46:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 744C3F80153; Thu, 21 Dec 2023 15:45:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7DAAF8024E
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 15:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7DAAF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=twNJ0TxK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 33BE8CE1F83;
	Thu, 21 Dec 2023 14:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23DDC433C8;
	Thu, 21 Dec 2023 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703169938;
	bh=9rUMqr3K4HJZTAFenjHNt1RV6itpPVxCJDKk8eXJ70Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=twNJ0TxK/ZrNUOVV40ykRbbBjBf3fBhJLAizFgMQkg3d3vtHFzLECRnsKnCJD30LS
	 GH4bJX0g0rMfL5KgAOhlhPWSyjuitVGd00pA6i86SRN4VCO70AbSx+SjiVrrtaQZLQ
	 Vbt3n9691Rhb6zT5VraThHf/aSUGnxfEWIG/tl7oeOnH35K5aQjhsBsuvfhFSJI+XQ
	 fJQe2uTVtrJNfqLNW++rOw9YIRMdCB5MTVhRloTgmkI6PrF/vxvNmUP64st3yfObYG
	 MZ8m4JpOgCnOlSNM1KQ+2QwwMtjBeiMxTPBm6Kir9QitqQ+XYNfXnBXy5yxNql+lM2
	 15wgtx65QIhJQ==
Date: Thu, 21 Dec 2023 20:15:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	tiwai@suse.de, broonie@kernel.org, vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Message-ID: <ZYRPjsLI1zZl6nqe@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <ZYAvoFbEP8RH_x0Y@matsya>
 <a5d0e3a7-e45c-4971-8ad7-7ba19702acf1@linux.intel.com>
 <20231218142946.GZ14858@ediswmail.ad.cirrus.com>
 <a4bfdc56-b323-4c13-a09e-c0f5baf40450@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4bfdc56-b323-4c13-a09e-c0f5baf40450@linux.intel.com>
Message-ID-Hash: O7XXQIALXTFMDEXZXBSGGQYPER4ZNA4R
X-Message-ID-Hash: O7XXQIALXTFMDEXZXBSGGQYPER4ZNA4R
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7XXQIALXTFMDEXZXBSGGQYPER4ZNA4R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18-12-23, 17:33, Pierre-Louis Bossart wrote:
> 
> 
> On 12/18/23 08:29, Charles Keepax wrote:
> > On Mon, Dec 18, 2023 at 01:58:47PM +0100, Pierre-Louis Bossart wrote:
> >>> why not have a single API that does both? First check if it is supported
> >>> and then allocate buffers and do the transfer.. What are the advantages
> >>> of using this two step process
> >>
> >> Symmetry is the only thing that comes to my mind. Open - close and send
> >> - wait are natural matches, aren't they?
> >>
> >> We do need a wait(), so bundling open() and send() would be odd.
> >>
> > 
> > I agree send->wait->close would be odd, But you just bundle close
> > into wait. So the API becomes just send->wait, which seems pretty
> > logical.
> 
> Fair enough, send()/wait() would work indeed.
> 
> I guess I wanted to keep the callbacks reasonably small (already 200
> lines for the open), but we can split the 'send' callback into smaller
> helpers to keep the code readable. There's no good reason to expose
> these smaller helpers to codec drivers.

Yes! that would be a better design IMO

> 
> >> But you have a point that the open() is not generic in that it also
> >> prepares the DMA buffers for transmission. Maybe it's more natural to
> >> follow the traditional open(), hw_params(), hw_free, close() from ALSA.
> > 
> > I think this just makes it worse, you are now adding even more
> > calls. The problem I see here is that, open and close (at least to
> > me) strongly implies that you can do multiple operations between
> > them and unless I have misunderstood something here you can't.
> 
> That's right, the open was not compatible with multiple operations.
> Collapsing open/send and wait/close sounds more logical, thanks for the
> feedback.

Sure

-- 
~Vinod
