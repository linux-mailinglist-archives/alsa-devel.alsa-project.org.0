Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3986981B9B3
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 15:40:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 306BD207;
	Thu, 21 Dec 2023 15:40:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 306BD207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703169641;
	bh=EfDpHN4WSMBhJVoFAooWZp4yWFs/ylynn70pHnqp8dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ca0RYyfro39/irLBogUAIuQ54nl1Kz9VEIGmCx2LGf7kTi+nXwnR1hZKn8aN7SA1/
	 cFLYjbSYVVSv5t9Wd+a1W+VJ3PNU1OzijghK8S/peBPNYZEAh51S002s424khVDnDs
	 ZRPhgu34dWNXcLmw6JmyxyeX02Hps8kUCSAbxV3A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF73DF80212; Thu, 21 Dec 2023 15:40:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D971FF8024E;
	Thu, 21 Dec 2023 15:40:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CEFBF80153; Thu, 21 Dec 2023 15:40:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BCE4F800D2
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 15:39:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BCE4F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QpcJZq0z
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 484DFCE1F87;
	Thu, 21 Dec 2023 14:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A604C433C7;
	Thu, 21 Dec 2023 14:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703169587;
	bh=EfDpHN4WSMBhJVoFAooWZp4yWFs/ylynn70pHnqp8dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QpcJZq0zvBsItx2hHM5ZlLjRWoH7xgvtc6E3L04RXa9mpRmGVtAB1vT/9Iy0anL2I
	 zDI7utMf50m9WUxfLVaQKN+k9CCcg8akfHAs07XzntMWsnyAVMJgL/mmhn941Tnepu
	 acXRbI3/3bh8eU7Yf09Wu6WFClu44NVQTETTsH2oXj6FCOuQzEzxN6+939hSI6/YEm
	 sFA1qP9beSHUaRv6BfIF9Zf7ZKhAtffd+jXMrSll3cHEfdX4cDcT2S8d9z6nvn8HYH
	 XJ5fnGObRbP0M/dcIXyvBSFJtTijNzU2ER50greGYZbJnWOum28rMpW2dxwrYFRClS
	 JBNIzvTJBEc/g==
Date: Thu, 21 Dec 2023 20:09:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	broonie@kernel.org, vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 08/16] soundwire: bus: add bpt_stream pointer
Message-ID: <ZYROLuFZNdwGHReR@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-9-pierre-louis.bossart@linux.intel.com>
 <ZYAzS3tggqQg8_PW@matsya>
 <87b3fc89-f967-4251-b709-0d439c6f1cf7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87b3fc89-f967-4251-b709-0d439c6f1cf7@linux.intel.com>
Message-ID-Hash: MZC5WJRXA24VRNQV2E6AATGDPEGC4YUZ
X-Message-ID-Hash: MZC5WJRXA24VRNQV2E6AATGDPEGC4YUZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZC5WJRXA24VRNQV2E6AATGDPEGC4YUZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18-12-23, 14:20, Pierre-Louis Bossart wrote:
> 
> 
> On 12/18/23 05:55, Vinod Koul wrote:
> > On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
> >> Add a convenience pointer to the 'sdw_bus' structure. BPT is a
> >> dedicated stream which will typically not be handled by DAIs or
> >> dailinks. Since there's only one BPT stream per link, storing the
> >> pointer at the link level seems rather natural.
> >>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >> ---
> >>  include/linux/soundwire/sdw.h | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> >> index e54c5bbd2b91..8db0cd7d0d89 100644
> >> --- a/include/linux/soundwire/sdw.h
> >> +++ b/include/linux/soundwire/sdw.h
> >> @@ -965,6 +965,7 @@ struct sdw_master_ops {
> >>   * @stream_refcount: number of streams currently using this bus
> >>   * @btp_stream_refcount: number of BTP streams currently using this bus (should
> >>   * be zero or one, multiple streams per link is not supported).
> >> + * @bpt_stream: pointer stored for convenience.
> >>   */
> >>  struct sdw_bus {
> >>  	struct device *dev;
> >> @@ -996,6 +997,7 @@ struct sdw_bus {
> >>  	int hw_sync_min_links;
> >>  	int stream_refcount;
> >>  	int bpt_stream_refcount;
> >> +	struct sdw_stream_runtime *bpt_stream;
> > 
> > So we are limiting to single stream? Can we have multiple transfers
> > queued up, which I guess might imply multiple streams?
> 
> 
> Yes for now there is a BTP/BRA single stream active when there are no
> audio transfers taking place. This is the only way to guarantee
> predictable download/resume times.
> 
> There is no mechanism to queue up transfers, be it from the same
> peripheral device or different ones. It would be up to the peripheral
> driver to wait for the BTP stream to be available.
> 
> Adding a queuing mechanism is a bridge too far for now, most platforms
> only have 1 or 2 devices only, and a peripheral driver may or may not be
> ok with delayed downloads. For now the main ask is to reduce download
> times, a single stream is already a good start. There are other
> refinements we need to add as well, such as changing clocks to use the
> fastest gear. I'd like to proceed with baby steps...

Since the API is async in nature, I think it is very reasonable that we
add the queue support (a simple list would do) and notify when the
transfer is complete..

-- 
~Vinod
