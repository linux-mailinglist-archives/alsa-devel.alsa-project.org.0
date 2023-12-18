Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA59816D15
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 12:56:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59A7D844;
	Mon, 18 Dec 2023 12:56:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59A7D844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702900601;
	bh=I7ksKDOitB86N7lt6ezJkH+UJhPIeJM2YzBoqBSdqrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MeowT2OOJXU8bJqcjEr7I0dyb4W/wtFnxCiO02iOVwmbJy8la8Yt6eggHRcCzTAmz
	 lYlFa0qieQLp0gfunIEtVLwkLxtAirdUqIfvjLcIysLW0littVk6vHFzFHi/GgfkXH
	 1XJGiNHrtjPXLnla1uyWmU4tGa6pUJEYGZYgSFwg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F5C8F8057C; Mon, 18 Dec 2023 12:56:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74912F8057C;
	Mon, 18 Dec 2023 12:56:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A155F80425; Mon, 18 Dec 2023 12:56:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BF53F800BD
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 12:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BF53F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=P5sF7QdK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D24CB60F7D;
	Mon, 18 Dec 2023 11:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8B6C433C8;
	Mon, 18 Dec 2023 11:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702900560;
	bh=I7ksKDOitB86N7lt6ezJkH+UJhPIeJM2YzBoqBSdqrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5sF7QdK+FTt+mTIF691q9wiZH+mRygUC953REKGDPzYGxdwf8J3T8zYj7sBaYkoo
	 vRMYeHKyMZXJkvJWo7X5lwTbiKLgyk/+8sbrORdWtIEigAW0FnMmu+8aomGetWbDAK
	 2jCD4ACx/GEWlwAOetD27KNuoS9Iwzute3SlIp2pHAJtTeoLw0gLzaOCBVdv65sQ5W
	 JrVkg91+axBzT58A0dUx+OLsZ/+xCCxyIMseowbs37fKG0it+XjbKTW77wR1EnChOu
	 QqtUcvg2K2f2GyX/bAv1YAmF9Z6cLvLRzoRZ45KuKthvXLCPLohJcj6UJ9R3vztrvR
	 7UAynGjd5EXWA==
Date: Mon, 18 Dec 2023 17:25:55 +0530
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
Message-ID: <ZYAzS3tggqQg8_PW@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-9-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207222944.663893-9-pierre-louis.bossart@linux.intel.com>
Message-ID-Hash: BTIEDMMG7Y25UR2INHRNUXAYRJR3Q725
X-Message-ID-Hash: BTIEDMMG7Y25UR2INHRNUXAYRJR3Q725
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BTIEDMMG7Y25UR2INHRNUXAYRJR3Q725/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
> Add a convenience pointer to the 'sdw_bus' structure. BPT is a
> dedicated stream which will typically not be handled by DAIs or
> dailinks. Since there's only one BPT stream per link, storing the
> pointer at the link level seems rather natural.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  include/linux/soundwire/sdw.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index e54c5bbd2b91..8db0cd7d0d89 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -965,6 +965,7 @@ struct sdw_master_ops {
>   * @stream_refcount: number of streams currently using this bus
>   * @btp_stream_refcount: number of BTP streams currently using this bus (should
>   * be zero or one, multiple streams per link is not supported).
> + * @bpt_stream: pointer stored for convenience.
>   */
>  struct sdw_bus {
>  	struct device *dev;
> @@ -996,6 +997,7 @@ struct sdw_bus {
>  	int hw_sync_min_links;
>  	int stream_refcount;
>  	int bpt_stream_refcount;
> +	struct sdw_stream_runtime *bpt_stream;

So we are limiting to single stream? Can we have multiple transfers
queued up, which I guess might imply multiple streams?

-- 
~Vinod
