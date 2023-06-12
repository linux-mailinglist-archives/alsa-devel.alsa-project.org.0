Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D5572C884
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 16:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06AAE826;
	Mon, 12 Jun 2023 16:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06AAE826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686580180;
	bh=iQXHfbvQH3aOmRvPB1iO6in5vsPbqu7hrkKvO0WM2Eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=epWaIRxpwxSwCU5oIzAyCtQ/9C48R5LRc2IAtSf2oK1nK09JyhJEbcrfnmXnxQu/y
	 OsInWxA5K7rF3lhVwf/6fLmJx9Q7WJpYs8j14h/YaIcYZM+1xxufadR99MyNZTSPsz
	 yM0TzYcqxWG50NYoiRKHYo5oCa8zz2CM7NzG2hFM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B733F8025E; Mon, 12 Jun 2023 16:28:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CF5AF80132;
	Mon, 12 Jun 2023 16:28:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81935F80149; Mon, 12 Jun 2023 16:28:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4F98F800ED
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 16:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4F98F800ED
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 789E224236;
	Mon, 12 Jun 2023 10:28:36 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8iX6-QHG-00; Mon, 12 Jun 2023 16:28:36 +0200
Date: Mon, 12 Jun 2023 16:28:36 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH] ALSA: pcm: fix wait_time calculations
Message-ID: <ZIcrlOSlA233SC2y@ugly>
References: <20230405201219.2197774-1-oswald.buddenhagen@gmx.de>
 <b57c46a6-4446-3418-fc4a-8bef1e28868c@nvidia.com>
 <76082a48-508b-e5cf-6ae0-66c265ecfdd7@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <76082a48-508b-e5cf-6ae0-66c265ecfdd7@nvidia.com>
Message-ID-Hash: 7JEXK7GV3YVEUA327WNWP37NUZHKIM6P
X-Message-ID-Hash: 7JEXK7GV3YVEUA327WNWP37NUZHKIM6P
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7JEXK7GV3YVEUA327WNWP37NUZHKIM6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 12, 2023 at 02:16:15PM +0100, Jon Hunter wrote:
>On 12/06/2023 13:18, Jon Hunter wrote:
>> On 05/04/2023 21:12, Oswald Buddenhagen wrote:
>>> ... in wait_for_avail() and snd_pcm_drain().
>> 
>> Sorry for not catching this sooner, but I have just noticed that one of 
>> our audio tests for Tegra is failing on v6.4-rc and bisect is pointing 
>> to this commit. Reverting this on top of the current mainline fixes it.
>> 
>If I enable the debug prints, I do see the following messages ...
>
>  tegra-audio-graph-card sound: capture read timeout (DMA or IRQ trouble?)
>
yes, this is the kind of fallout one would expect from this change, as 
it significantly shortened the effective timeout under most 
circumstances.

first check that there isn't a genuine underlying bug, that is, that the 
unusually slow timings match expectations.

if everything looks right, then properly codify the timeout in the 
driver by setting substream->wait_time as required.
the lazy approach of more or less restoring the previous status quo 
would be setting it to 10000 in the `open` callback.
fwiw, soc/sof sets it to 500, which may actually be a bad idea (it's 
short enough that a very long period time would exceed it, if such is 
permitted). and it's not obvious why it does that.

regards
