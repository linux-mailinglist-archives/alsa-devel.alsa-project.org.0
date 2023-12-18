Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94167816C97
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 12:41:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BDBC83B;
	Mon, 18 Dec 2023 12:41:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BDBC83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702899671;
	bh=uPQEOc5Zgz5g44nukLkiI4sq8EFh+IPAn/hUt5T+gDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UDEJka6e0DJX8JeH5QArRrLwlBZTgYvwsllVRSQ2gW0kmBIi1m2AtSM33JCJTPz6H
	 8z4mrxTSq9CdU9xqKX5oVOargVqqdnRFkKYZt4HFUnSclWpDMqgRpqBvZpVXbPBNaR
	 So/syxNK9WJyDHeBGWX/G27lXjO8qvngSO1zJ3i0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA509F8057F; Mon, 18 Dec 2023 12:40:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B3C2F80124;
	Mon, 18 Dec 2023 12:40:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFB43F80425; Mon, 18 Dec 2023 12:40:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7FEDF80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 12:40:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7FEDF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AELLgjZw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1FD060F77;
	Mon, 18 Dec 2023 11:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E730EC433C7;
	Mon, 18 Dec 2023 11:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702899621;
	bh=uPQEOc5Zgz5g44nukLkiI4sq8EFh+IPAn/hUt5T+gDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AELLgjZwRNqa5Ut9XG3o3XvJ/tWd5EXzvy+cHriyoorOtmOrMz9rFLpRSuB1UpgVR
	 ym2k1F07rkdXVE7eXcHSllmmqqFyt42dI7+bKaxaprPTATTPkbCpDTsKz2JFOu6HEZ
	 5yxcQUA++nVp6I3bKMN0AjNQOJkGdpi3v/GcwX1xi/kmiHAwp72xVkMi4O5pBxyuDK
	 slZu/VXhH1XFfmBCR3oEfg0RQ9ngadCy0O0wGnkTmpXdRYNU1SH1IiKus1BBYOoD0Q
	 X/j9Y8BlOrA3IPlxu7LAP52QQviI/XKw4xdg4HDQ7dAayn5qC2+pPBHNuL2+FbW1qH
	 WEM6CjG0E1BdA==
Date: Mon, 18 Dec 2023 17:10:16 +0530
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
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Message-ID: <ZYAvoFbEP8RH_x0Y@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
Message-ID-Hash: IG3GPT2H4B426DFVHERD6K7VQUOUEPVT
X-Message-ID-Hash: IG3GPT2H4B426DFVHERD6K7VQUOUEPVT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IG3GPT2H4B426DFVHERD6K7VQUOUEPVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
> The Bulk Register Access protocol was left as a TODO topic since
> 2018. It's time to document this protocol and the design of its Linux
> support.

Thanks for letting me know about this thread. At least now with B4 we
can grab threads we are not copied.

> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  Documentation/driver-api/soundwire/bra.rst    | 478 ++++++++++++++++++

Can we split the cadence parts of this to bra-cadence.rst that way this
file documents the core parts only

> +Concurrency between BRA and regular read/write
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The existing 'nread/nwrite' API already relies on a notion of start
> +address and number of bytes, so it would be possible to extend this
> +API with a 'hint' requesting BPT/BRA be used.
> +
> +However BRA transfers could be quite long, and the use of a single
> +mutex for regular read/write and BRA is a show-stopper. Independent
> +operation of the control/command and BRA transfers is a fundamental
> +requirement, e.g. to change the volume level with the existing regmap
> +interface while downloading firmware.
> +
> +This places the burden on the codec driver to verify that there is no
> +concurrent access to the same address with the command/control
> +protocol and the BRA protocol.
> +
> +In addition, the 'sdw_msg' structure hard-codes support for 16-bit
> +addresses and paging registers which are irrelevant for BPT/BRA
> +support based on native 32-bit addresses. A separate API with
> +'sdw_bpt_msg' makes more sense.
> +
> +One possible strategy to speed-up all initialization tasks would be to
> +start a BRA transfer for firmware download, then deal with all the
> +"regular" read/writes in parallel with the command channel, and last
> +to wait for the BRA transfers to complete. This would allow for a
> +degree of overlap instead of a purely sequential solution. As a
> +results, the BRA API must support async transfers and expose a
> +separate wait function.

That sounds logical to me

> +
> +Error handling
> +~~~~~~~~~~~~~~
> +
> +The expected response to a 'bra_message' and follow-up behavior may
> +vary:
> +
> +   (1) A Peripheral driver may want to receive an immediate -EBUSY
> +       response if the BRA protocol is not available at a given time.
> +
> +   (2) A Peripheral driver may want to wait until a timeout for the
> +       on-going transfer to be handled
> +
> +   (3) A Peripheral driver may want to wait until existing BRA
> +       transfers complete or deal with BRA as a background task when
> +       audio transfers stop. In this case, there would be no timeout,
> +       and the operation may not happen if the platform is suspended.

Is this runtime suspend or S3/S4 case?

> +BTP/BRA API available to peripheral drivers
> +-------------------------------------------
> +
> +ASoC Peripheral drivers may use
> +
> +   - sdw_bpt_stream_open(mode)
> +
> +      This function verifies that the BPT protocol with the
> +      'mode'. For now only BRA is accepted as a mode. This function
> +      allocates a work buffer internally. This buffer is not exposed
> +      to the caller.
> +
> +     errors:
> +         -ENODEV: BPT/BRA is not supported by the Manager.
> +
> +         -EBUSY: another agent is already using the audio payload for
> +          audio transfers. There is no way to predict when the audio
> +          streams might stop, this will require the Peripheral driver
> +          to fall back to the regular (slow) command channel.
> +
> +         -EAGAIN: another agent is already transferring data using the
> +          BPT/BRA protocol. Since the transfers will typically last
> +          10s or 100s of ms, the Peripheral driver may wait and retry
> +          later.
> +
> +    - sdw_bpt_message_send_async(bpt_message)

why not have a single API that does both? First check if it is supported
and then allocate buffers and do the transfer.. What are the advantages
of using this two step process

-- 
~Vinod
