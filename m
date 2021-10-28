Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F310A43DEF9
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 12:34:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8983516A5;
	Thu, 28 Oct 2021 12:34:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8983516A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635417296;
	bh=nXaHjsAiBzzc2QIQZHfTDmCeTd0h9GLEfh5VoLHsZEk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g0HIY+3EHJZjEJ83RjmCBs1ANo+6fcDG7wsef8eb2LK42SOk+1eLTdWYeNs7ZA4Wp
	 RRvTQW5jBzQwuxPrIRZK8w0Lav0JAX28cBYVClPLN83y46WWM9aFVtZCKx+Etm2b29
	 BY4e4aIgwHVuzx4eFRfWMM6Xs55I2RsbiLE0H3CQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6ED1F8010A;
	Thu, 28 Oct 2021 12:33:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79391F8010A; Thu, 28 Oct 2021 12:33:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 358C9F8014E
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 12:33:28 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7F12CA003F;
 Thu, 28 Oct 2021 12:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7F12CA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1635417207; bh=CL+QX8ui1kgCPFYnJYOdUd2VcMrOogKTV+VFqK4O44s=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=bdWSB/YY7ge3nOyoxdB//j0ZWzsadew4/uSAaMH/NBybclStzrU/7/gSIBxBR8Xch
 CrRZwgGTN1Bnnc3tWpv4iqVcTEQZ0HOqAjOg96usvat28k2qgnMaxGWeXASi5oMRP6
 6XeUDyJu4C+/vN2jpMcPN6tvreGQplnX8nQp/Tv4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 28 Oct 2021 12:33:25 +0200 (CEST)
Message-ID: <ae55f1c6-57f1-b940-5902-e1160be25d4c@perex.cz>
Date: Thu, 28 Oct 2021 12:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] alsaloop: Renamed field capt_pitch to ctl_pitch
Content-Language: en-US
To: Pavel Hofman <pavel.hofman@ivitera.com>, alsa-devel@alsa-project.org
References: <20211024083156.4743-1-pavel.hofman@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20211024083156.4743-1-pavel.hofman@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 24. 10. 21 10:31, Pavel Hofman wrote:
> Renaming capt_pitch to ctl_pitch to respect the naming style of
> snd_ctl_elem_value_t fields in loopback_handle. Also making the variable
> name suitable for planned support of playback pitch.
> 
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>

Applied both patches. Thank you.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
