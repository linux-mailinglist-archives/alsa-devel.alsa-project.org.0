Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4026341C31B
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 13:00:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B830816A6;
	Wed, 29 Sep 2021 12:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B830816A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632913212;
	bh=TkW8ehuv4ccKeO7pVBiDtQU/5cs1Ri23p9KyHZ4o/B0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dn2eJhUbjM2xjCetQhSKgV5VN5QEk7VKk3uCL9vtvvyriZrCu/sN4807950VWoIMZ
	 A7F1i9jLw/LiSOFTOLoRitOlsxKmpvMSZXkpyphRLQEQFCa8m+vCa/rgaKXHeDJhxD
	 0lLmCH6tQjt7F/6LJf3JLzxp6hrCJThKy2n9odWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C092F8026D;
	Wed, 29 Sep 2021 12:58:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5598BF80227; Wed, 29 Sep 2021 12:58:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AEF7F80105
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 12:58:45 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7B146A003F;
 Wed, 29 Sep 2021 12:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7B146A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1632913124; bh=K1iKq9moPmz3lpe7HLhfT+k0j5+ZM8clfp15g1xQltM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EXjp8GA5AQ/JNqV3l2+nGdBINtsGLQksOCbljWLqanZCzCMKVN5rFZQbvPk82Ukok
 Ksc0I+JTVsqj9ZHC1cL00o/BPdanDQLhmXyY9s0WsNUtgTuf+Jn/TpMumq3V4u9V7e
 Fb6+lQOgzX1UtUUIbq9fi7ntbMi46jhV+n0gjnRo=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 29 Sep 2021 12:58:40 +0200 (CEST)
Message-ID: <23bff35b-71ab-1f8c-c03f-664ec051f194@perex.cz>
Date: Wed, 29 Sep 2021 12:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH alsa-ucm-conf 0/5] bytcr-rt5640: Fixes and improvements
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>
References: <20210929091144.4778-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20210929091144.4778-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 29. 09. 21 11:11, Hans de Goede wrote:
> Hi Jaroslav,
> 
> Here is a patch series with 2 bug-fixes for X86 devices with a rt5640
> codec (these 2 are a resend) + 3 patches adding support for the second
> headset-jack (on the dock) found on the HP elitepad 1000 G2.
> 
> The new kernel-bits for the second headset-jack have already landed,
> so this is ready for merging.

Thank you for this update and your work. I applied all patches to the 
alsa-ucm-conf repo.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
