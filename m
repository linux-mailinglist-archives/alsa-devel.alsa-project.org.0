Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9289A94DBEA
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2024 11:19:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B0ED14EA;
	Sat, 10 Aug 2024 11:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B0ED14EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723281556;
	bh=Ob3FxBBXolQb8TSNkw7wVEqH25eTxoNzKRSeMRC4IGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N50/WLMO1K3FM45J+CD6286ii9JxIyit6n3xRunHRvowbSuCm9KlyOYIXWcD+eork
	 x6kIKIeyNCgEMfjY5piEdb0jS4roIWLhZkm6f9fIYQVIHbHItzkw99r7VND/HGp2ez
	 2Z8e9/BZH+ibfTFflZFHCur3fkqEtAnROEBqJFZo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1317F805B6; Sat, 10 Aug 2024 11:18:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33AE4F80448;
	Sat, 10 Aug 2024 11:18:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 430C5F802DB; Sat, 10 Aug 2024 11:14:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCA7CF800E3
	for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2024 11:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCA7CF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fF282oPu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C366ACE1730;
	Sat, 10 Aug 2024 09:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFE7C32781;
	Sat, 10 Aug 2024 09:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723281240;
	bh=Ob3FxBBXolQb8TSNkw7wVEqH25eTxoNzKRSeMRC4IGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fF282oPuVU2f4UxhRPjzu/9f1ONAbASiPCu4oAe8mCQmU8Gx4pXdBWOe/aYOo1qws
	 YF0K8X4sHrU4apZP2pIFqxiHYa6ZC/ru+Y+lkDL5Z8obKKK6Tkzlt9MGx5l1tfj/dx
	 2EiTOh8yLri7akXpsQYnenlGykwtFSi/5+kq+ozNRTtcjETqqEaO7T8Y0jZrXMkUnh
	 g8cldeFUvPLYRyEHTGCYPiAqkBuLYbaBW6CmthVodzIK10dHjzFMxyxjWRYnH/P6f2
	 o2TkcMEaKIeqa1eLwWZgEk1kgv3ZNNCQm2Pg/1HwMylw5vkCtK8f5GBAFa3Sy3iA0L
	 wWESk/wCyuJVg==
Date: Sat, 10 Aug 2024 05:13:59 -0400
From: Sasha Levin <sashal@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.10 02/11] ASoC: Intel: sof_sdw: Add quirks for
 some new Dell laptops
Message-ID: <ZrcvVz_5EQioiFft@sashalap>
References: <20240728160954.2054068-1-sashal@kernel.org>
 <20240728160954.2054068-2-sashal@kernel.org>
 <ZqdFCzqqkEWFl8tA@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZqdFCzqqkEWFl8tA@duo.ucw.cz>
Message-ID-Hash: DOQBPX5463AXZDYB6MM3MJUW5LXBRCXE
X-Message-ID-Hash: DOQBPX5463AXZDYB6MM3MJUW5LXBRCXE
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DOQBPX5463AXZDYB6MM3MJUW5LXBRCXE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 29, 2024 at 09:30:19AM +0200, Pavel Machek wrote:
>Hi!
>
>> From: Charles Keepax <ckeepax@opensource.cirrus.com>
>>
>> [ Upstream commit 91cdecaba791c74df6da0650e797fe1192cf2700 ]
>>
>> Add quirks for some new Dell laptops using Cirrus amplifiers in a bridge
>> configuration.
>
>This is queued for 5.10, but not for 6.1. Mistake?

Yup, needs to get dropped from everywhere. Thanks!

-- 
Thanks,
Sasha
