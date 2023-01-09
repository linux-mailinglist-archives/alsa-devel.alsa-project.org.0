Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF8A6625B8
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 13:36:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8B396C1B;
	Mon,  9 Jan 2023 13:35:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8B396C1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673267798;
	bh=Gw7CvHdjKc8HwPi5QQEoTq9+XTu1vmAKL3TmGZisWcg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ve2PGN/7aIj5KBa1Syr6G3VBgajFa9Y4JhVxBYIXq9dOfbv2hNiJiAzEK5MYO7xN4
	 2Cn6TyKkwV0Hiz4PCrWuCb5pQ6SuNX/Ckz6eTUYMegH+bCHvDSkEL0ymSxo2woLN4b
	 mkclhjkOY1h0rXcHqCKj1hUP9ETdhq6dI0BQ+xJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27354F8026A;
	Mon,  9 Jan 2023 13:35:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E41EEF8030F; Mon,  9 Jan 2023 13:35:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4585F80245;
 Mon,  9 Jan 2023 13:35:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4585F80245
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iiNedEND
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4CB96105D;
 Mon,  9 Jan 2023 12:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA36C43392;
 Mon,  9 Jan 2023 12:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673267729;
 bh=Gw7CvHdjKc8HwPi5QQEoTq9+XTu1vmAKL3TmGZisWcg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iiNedENDzk+D5IwFc5TjAK3fVsmIF9LczOPprOhSeTYtLuNVxCWFTTbLDe++inHop
 DlbgRiZa1ba+tKcS1L2eK7b/VgUtLTybT+A7Fy9QhTjK/deFNSUrwX1wuz5nHx8Urm
 TK8FyGv0N0KBm4Km9iTJAtgzJBqy8DgbCWhMp/pQ5d/kxRq6K1mGY2gUNQjKRJWQhP
 6y6moJyuH0kLvCBD8MJcUPaRy91VhFGENWVu+zJAbcCaFTE3qK0W4f3LGkefcdUdy1
 SA4iExQB+c2KQIotFki+tDXX2cYLv/jioJGvHCsd1NCIx8JdItG0VXDIogQC6EK6WW
 9CLyRCAlyoscA==
Date: Mon, 9 Jan 2023 07:35:27 -0500
From: Sasha Levin <sashal@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH AUTOSEL 6.1 1/7] ASoC: SOF: Revert: "core: unregister
 clients and machine drivers in .shutdown"
Message-ID: <Y7wKD6ayGW3HjV5N@sashalap>
References: <20221231200439.1748686-1-sashal@kernel.org>
 <alpine.DEB.2.22.394.2301041427580.3532114@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2301041427580.3532114@eliteleevi.tm.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: daniel.baluta@nxp.com, Alsa-devel <alsa-devel@alsa-project.org>,
 yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 04, 2023 at 02:34:55PM +0200, Kai Vehmanen wrote:
>Hi,
>
>On Sat, 31 Dec 2022, Sasha Levin wrote:
>
>> From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>>
>> [ Upstream commit 44fda61d2bcfb74a942df93959e083a4e8eff75f ]
>>
>> The unregister machine drivers call is not safe to do when
>> kexec is used. Kexec-lite gets blocked with following backtrace:
>
>this should be picked together with commit 2aa2a5ead0e ("ASoC: SOF: Intel:
>pci-tgl: unblock S5 entry if DMA stop has failed"), to not bring back old
>bugs (system failures to enter S5 on shutdown). The revert patch
>unfortunately fails to mention this dependency.
>
>If I'm too late with my reply, I can send the second patch separately to
>stable.

I took 2aa2a5ead0e along with this patch, thanks!

-- 
Thanks,
Sasha
