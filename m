Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADD370866A
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 19:10:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25868208;
	Thu, 18 May 2023 19:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25868208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684429807;
	bh=Qm04zr0gSo5j8CHzYq69b7TQ96spiaJHuZriamU5aFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LuBP4srzvsjN2VC5EXLbXbozD+3kAXf9rvfvqsp9mmqidGotRxvksTnu/knAcxYFT
	 Rujk2uJJ01AHCgbmpCvjtGjjHbRO6bqj9tsJVEIlK6KwNZD3e5qgQ/S/7Wi02D4war
	 0+DuFNYPnwy9g3Rjw1eV+s+S9C1XPJZYdHRiMxHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D814F80548; Thu, 18 May 2023 19:09:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18D49F8025A;
	Thu, 18 May 2023 19:09:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 155B7F80272; Thu, 18 May 2023 19:09:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6DA3F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 19:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6DA3F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D84hh/0X
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2260E618C1;
	Thu, 18 May 2023 17:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AB5C433EF;
	Thu, 18 May 2023 17:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684429745;
	bh=Qm04zr0gSo5j8CHzYq69b7TQ96spiaJHuZriamU5aFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D84hh/0XA0ozwmpMMrs4sFMjViu1VoMJRP6GWM9Nzg3Up7bN7caKpV+nTl3MqSE1d
	 2NBAnTfzjAD+g8HuVJ7QmIzi1/HxdzPKIK9dphKMBDa5z8cnSyFyt2FSp0sw6gBhxz
	 YEFfZijdUynl4EAAUyfNkjp4jfMtyusPQjHEL05u7ss+GrZB3ljzTBw6c8+xFkVA+x
	 ZfST8N5IG0x9P2h8dw5bbzeiyz3mHqkXy4l61rZWSMhuHGkLzCJwetSsznX9PZBsNA
	 U3kjzI4foq3gcY9jB29N7xoIAW8NYOJF1SdxMDIKfNmnLuaoWMmi0T2OG4lmZJcKHF
	 AzVFuF88OdTUw==
Date: Thu, 18 May 2023 13:09:04 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Svyatoslav Ryhel <clamor95@gmail.com>, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH AUTOSEL 6.3 01/24] ASoC: jack: allow multiple interrupt
 per gpio
Message-ID: <ZGZbsIMIa6qgU0ht@sashalap>
References: <20230507003022.4070535-1-sashal@kernel.org>
 <ZFg2ZWqEBkPsJk+Y@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZFg2ZWqEBkPsJk+Y@finisterre.sirena.org.uk>
Message-ID-Hash: BDHCKXV22IXGG2GQVXVG5UWLG66QV4MX
X-Message-ID-Hash: BDHCKXV22IXGG2GQVXVG5UWLG66QV4MX
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDHCKXV22IXGG2GQVXVG5UWLG66QV4MX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, May 08, 2023 at 08:38:13AM +0900, Mark Brown wrote:
>On Sat, May 06, 2023 at 08:29:57PM -0400, Sasha Levin wrote:
>> From: Svyatoslav Ryhel <clamor95@gmail.com>
>>
>> [ Upstream commit a2d4051b0bd6dffcd736888ae89a550d6f60b060 ]
>>
>> This feature is required for coupled hp-mic quirk used
>> by some Nvidia Tegra 3 based devices work properly.
>
>This is a new feature, why is it being backported to stable?

The quirk aspect of it :)

I can drop it and the other patch you've pointed out.

-- 
Thanks,
Sasha
