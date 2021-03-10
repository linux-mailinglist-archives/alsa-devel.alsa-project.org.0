Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 081783339EC
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 11:26:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74F761775;
	Wed, 10 Mar 2021 11:25:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74F761775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615371968;
	bh=Rm9c3cBrndV+3wTmWZRDREKPRRTdTIPpj1NY9ISuRFc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EzGpJV2MVoWosxJhicPlltsb/JyQRxt1ZcgABUKvUUJUqUAnNIfP1Tt474xOA/l6s
	 Focu7iAR2DKIfmGbFWv8tlT21LB1vh0RIU37SgRn9UYY4Xj6lyAbLJPzytr0oKlXM1
	 YA3VVtYasBpUxWgetmQugj95skXpxjFriGd3RR0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3335F8010D;
	Wed, 10 Mar 2021 11:24:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4CF9F801D8; Wed, 10 Mar 2021 11:24:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54B42F8010D
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 11:24:21 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B6274A003F;
 Wed, 10 Mar 2021 11:24:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B6274A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1615371859; bh=ROgG/PtaxjtZMLqu6lNwnQO9hMpszBD5BRw+ntc12PU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Q5D+fex7/SDz0BoIIo1x3r+VVtqBQT3VcwZt0zOgo1qNBq2NXe8SePHh/MJnqE5Nc
 rhvzY98i4HEyZkDT+dEUsmibrvm1QFptOe/zfGJl1RFfc7ZPN9rYX26XnIwbzn67B5
 7jnLEJJMg3fIZ5MPrFcJJuah2aZ61cNU/VI5rsCU=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 10 Mar 2021 11:24:15 +0100 (CET)
Subject: Re: [PATCH alsa-ucm-conf v2 0/7] codecs/rt5640: Cleanup + HW volume
 control support
To: Hans de Goede <hdegoede@redhat.com>
References: <20210308220554.76111-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <8a960a9a-fddb-dff5-42be-ca4ddd54122c@perex.cz>
Date: Wed, 10 Mar 2021 11:24:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308220554.76111-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

Dne 08. 03. 21 v 23:05 Hans de Goede napsal(a):
> Hi All,
> 
> Here is v2 of my patch series consisting of some codecs/rt5640 cleanups
> and addition of HW volume control support to the rt5640 .conf snippets.
> 
> This new version has been updated to deal with the
> "[PATCH 3/5] ASoC: rt5640: Add emulated 'DAC1 Playback Switch' control"
> kernel-patch being dropped.
> 
> Note patch 7 depends on a new "aif:%d" part being added to the
> components string, the kernel patches for this are pending upstream
> in the "[PATCH resend 0/2] AsoC: rt5640/rt5651: Volume control fixes"
> patch-series.

Applied all except the 7th patch.

Thank you.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
