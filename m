Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6667D2F1E6A
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 20:01:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA429173D;
	Mon, 11 Jan 2021 20:00:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA429173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610391698;
	bh=mMSUITB5hAdiia5ZhEO9xlIZguamzMiWk+q3BOcqL4g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uvyDiONOweYZKakwCeQ5q5Hw80YiUq5rgOMUuvrT7Gyxx+VdtVctw7lPtvYnYgfL1
	 PROB9hc8WdcIV0fGxDVX0lyYJrBITe2F1YU2heM1wyme47NxVM+ubeukY1GpTfjvD0
	 uN7L7QNabfdfjOZFVxGUiPU6TiroikGXLzXcqskc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5E65F8016C;
	Mon, 11 Jan 2021 20:00:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3629FF8016D; Mon, 11 Jan 2021 20:00:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85467F8013D
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 19:59:50 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 21F95A003F;
 Mon, 11 Jan 2021 19:59:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 21F95A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1610391585; bh=X2AeqByBYug1dqKCnGUT6OVwP97/6rGRZcmkFH18sik=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cH2EplvObz6fMU44mDOa1jyZih3IYzwogGoRNyhh07Nn9AhVeZp+cvLgij849y9j8
 xxHvl5smxGv6t5fpka4ujR9aA31qlLm6WxMYMz2kFBc2ZGvCRGTLeO/i6EsxOIq5Wz
 +2Ls1DoDylcEcObcW11ZnKv/e3id4IwLuPPi/tx0=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 11 Jan 2021 19:59:41 +0100 (CET)
Subject: Re: [PATCH alsa-ucm-conf 1/2] bytcr-rt5640: Add support for devices
 without speakers and/or an internal mic
To: Hans de Goede <hdegoede@redhat.com>
References: <20210109210252.159162-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <d5d4d125-c838-0ef9-e8be-2adb77688904@perex.cz>
Date: Mon, 11 Jan 2021 19:59:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210109210252.159162-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Rasmus Porsager <rasmus@beat.dk>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Dne 09. 01. 21 v 22:02 Hans de Goede napsal(a):
> There are kernel patches pending upstream for the bytcr-rt5640 machine-driver
> to support devices without speakers and/or an internal mic.
> 
> Since the UCM profile already conditionally loads the speaker and
> internal-mic codec include files, these will simply get skipped in this
> case, so this almost works with the current UCM profile without changes.
> 
> The only troublesome part is the ConflictingDevice sections in the codec
> HeadPhones.conf and HeadsetMic.conf files, which refer to resp. a "Speaker"
> and a "Mic" device. Without any of the speaker or mic codec conf files
> being included there will not by any "Speaker" / "Mic" devices leading
> to an error while parsing the HeadPhones.conf / HeadsetMic.conf files.
> 
> This commit makes the ConflictingDevice section conditional, fixing this.

Applied to the ucm repo. Thank you.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
