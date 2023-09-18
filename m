Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9596A7A5510
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 23:31:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADE6A84C;
	Mon, 18 Sep 2023 23:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADE6A84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695072681;
	bh=XjMzRlGBtNL1Q/EZymEQBbUOu0SfxSTsrHkQ27pJ5xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vGOdfzfR/FNALaotgvezUuNrj3GQHHSK9DhHDIvu7dCUdz7Dj+UM+G5o5RtBADCxH
	 QdpBrmbjuT+8CfBGWeBmASZX3pCa2bv/Z7Vz+6W+QUsX6liuLg52xt/cwKU6KwNhkc
	 qhwXAdS5suLsd32VqU1iXwIW8JEw/QXGhUmHBPMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11743F801F5; Mon, 18 Sep 2023 23:30:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B17A6F800AA;
	Mon, 18 Sep 2023 23:30:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2563AF8025A; Mon, 18 Sep 2023 23:30:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4EB3F800AA
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 23:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4EB3F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=heRd0VVZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 73622CE0B50;
	Mon, 18 Sep 2023 21:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9492EC433C8;
	Mon, 18 Sep 2023 21:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695072590;
	bh=XjMzRlGBtNL1Q/EZymEQBbUOu0SfxSTsrHkQ27pJ5xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=heRd0VVZxy2EvvKRsiW1igOyVxuUp5WJ4Z1SXq12KJ8XZAZqRQGnhcXzpS3HwF+Ia
	 igSQm+CHT1uohmHslvVQIDxkKTjNNujcM226VOyt92pfw7fta1OLsYa0QMsBsRKxlp
	 KCFjoAoPvLuLwsnpKP/HTWOR6Mnnss9pcwfK6sS3FAag8nCcS5NskW6/kt3KXntxjW
	 tT4rr+IYEdgSyhei0NOznehA3/+QbkPm4LMNkpX4n+qQ2mdGXDeosFtawqvOsaVqyp
	 FqyTtsrRZDzHSfwpKlvwkBzQ+dMi0zxqJkgfq/TDaBKQdorSvdGZ8zVkVn+ab943Gf
	 OLO8MPN2cu2lA==
Date: Mon, 18 Sep 2023 17:29:49 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	lucas.tanure@collabora.com, pierre-louis.bossart@linux.intel.com,
	rander.wang@intel.com, kuninori.morimoto.gx@renesas.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH AUTOSEL 6.4 04/31] ASoC: amd: vangogh: Use
 dmi_first_match() for DMI quirk handling
Message-ID: <ZQjBTUUJtY+1Q49X@sashalap>
References: <20230908193201.3462957-1-sashal@kernel.org>
 <20230908193201.3462957-4-sashal@kernel.org>
 <8d75077a-799a-4bf1-b259-a931c00fbc54@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <8d75077a-799a-4bf1-b259-a931c00fbc54@sirena.org.uk>
Message-ID-Hash: M44FVKXUKJBDVIXJFX5V3JAAGAZTRXMQ
X-Message-ID-Hash: M44FVKXUKJBDVIXJFX5V3JAAGAZTRXMQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M44FVKXUKJBDVIXJFX5V3JAAGAZTRXMQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Sep 09, 2023 at 12:20:16AM +0100, Mark Brown wrote:
>On Fri, Sep 08, 2023 at 03:31:33PM -0400, Sasha Levin wrote:
>> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>
>> [ Upstream commit 3dd26e27ccb4f18b4d25c0a49e1888eca9c6a724 ]
>>
>> In preparation for supporting ACPI probing, move DMI quirk handling
>> logic at the probe's top, to be able to return as quickly as possible in
>> case there is no DMI matching.
>
>As the changelog clearly says this is preparatory work for a new feature
>and therefore not stable material.

Dropped, thanks!

-- 
Thanks,
Sasha
