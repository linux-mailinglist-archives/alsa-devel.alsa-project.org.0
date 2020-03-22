Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2A618EBF7
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Mar 2020 20:41:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9122C15F8;
	Sun, 22 Mar 2020 20:40:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9122C15F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584906078;
	bh=aGGx1nH/psZA7otCHWR4bp5UFDdxLz4Yls1e8FeqbP8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FaTMMhEFvzKdvyVpnXGy94fD2A9gRPqeup9R5tOMbivhq5jANQ6LChURPf6emMe2p
	 nVhqufRYdWgaZTZF79eA6rXSXAUrgl0W9MPok5NFCZIrj1x6g6/3Dx+tj8oaO3dEGs
	 6JGOFj0LdVpg00krla0E6o9/IBRIG/5+SBR9YBTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78357F801A3;
	Sun, 22 Mar 2020 20:39:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76AD0F801F8; Sun, 22 Mar 2020 20:39:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EDD9F800C7
 for <alsa-devel@alsa-project.org>; Sun, 22 Mar 2020 20:39:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EDD9F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RpzIB6/N"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E2772070A;
 Sun, 22 Mar 2020 19:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584905962;
 bh=aGGx1nH/psZA7otCHWR4bp5UFDdxLz4Yls1e8FeqbP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RpzIB6/NcuUVL2rRNhtd463rKUSmMi1zOKWJ7aOy89Esuu+Q+/QRp6HstMSs9FGn9
 inmSJqWLSN0wR51pFwU8rnc8CDiAcu6Tf9IE78z9qzzL87ikGPu3sKiEsitLF1ibY+
 UWYLCHX1KEqkG4cc5p3hFaSV1vRn/OTd7bOX/sVA=
Date: Sun, 22 Mar 2020 15:39:21 -0400
From: Sasha Levin <sashal@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH AUTOSEL 5.4 08/35] ASoC: meson: g12a: add tohdmitx reset
Message-ID: <20200322193921.GP4189@sasha-vm>
References: <20200316023411.1263-1-sashal@kernel.org>
 <20200316023411.1263-8-sashal@kernel.org>
 <1ja74gg0v8.fsf@starbuckisacylon.baylibre.com>
 <1jsgi0ckcc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1jsgi0ckcc.fsf@starbuckisacylon.baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sun, Mar 22, 2020 at 07:31:31PM +0100, Jerome Brunet wrote:
>
>On Mon 16 Mar 2020 at 09:28, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>> On Mon 16 Mar 2020 at 03:33, Sasha Levin <sashal@kernel.org> wrote:
>>
>>> From: Jerome Brunet <jbrunet@baylibre.com>
>>>
>>> [ Upstream commit 22946f37557e27697aabc8e4f62642bfe4a17fd8 ]
>>>
>>> Reset the g12a hdmi codec glue on probe. This ensure a sane startup state.
>>>
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> Link: https://lore.kernel.org/r/20200221121146.1498427-1-jbrunet@baylibre.com
>>> Signed-off-by: Mark Brown <broonie@kernel.org>
>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>
>> Hi Sasha,
>>
>> The tohdmitx reset property is not in the amlogic g12a DT in v5.4.
>> Backporting this patch on v5.4 would break the hdmi sound, and probably
>> the related sound card since the reset is not optional.
>>
>> Could you please drop this from v5.4 stable ?
>
>Hi Sasha,
>
>I just received a notification that this patch has been applied to 5.4
>stable.
>
>As explained above, it will cause a regression.
>Could you please drop it from v5.4 stable ?

Hi Jerome,

Sorry - I've missed your previous mail. Now dropped from all trees.

-- 
Thanks,
Sasha
