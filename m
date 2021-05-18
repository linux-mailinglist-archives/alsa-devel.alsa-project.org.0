Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26060387D57
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 18:26:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B31E11739;
	Tue, 18 May 2021 18:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B31E11739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621355204;
	bh=CogxBhfHClUYsfAX45SqHVHNf6pJk0HNrAunCeaQUsM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d+7BjxGV5K7aXFYGiS9xRrtkMpMMo6I7J5X91f4EOtLLbwQ3F18nNu8HTiRY4Mu7m
	 ZShXsB2MqQAw9EPX3zBGt4u1Lm2y55ZCSvY+lkXpPcHYCNPt41by69QoavGDS0JbDl
	 PTTf+LkLE12i9Bk3RAf4enpX6+wVaSHnDT0DS8lg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B759F80229;
	Tue, 18 May 2021 18:25:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62688F80217; Tue, 18 May 2021 18:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0956AF8012C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 18:25:05 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6A4B9A003F;
 Tue, 18 May 2021 18:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6A4B9A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1621355105; bh=5v7TUQmTYDNuyqOyg13DWNuQdXHbBpVJ7BIxHs62ilM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=yN/yDDqHL0KhLGveq2gO3W63OXTYvdvwRkiJfeRowuqeOXInQQn379ypygU3GckV1
 xLwqMw9xMKEoznJbH1YhYPcudJ24/OoYRgCYFvm+9/WH3wCG4bfFXEgxis5RLgqGBg
 kiMs9moKH6Mn6SQ6msF41BaLQ5dHbCdOSPIlrGgQ=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 18 May 2021 18:25:01 +0200 (CEST)
Subject: Re: [PATCH alsa-ucm-conf 0/3] byt/cht: Add support for controlling
 mute LEDs using the new snd_ctl_led kmod
To: Hans de Goede <hdegoede@redhat.com>
References: <20210507131139.10231-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <83c4aadb-2bd1-aa82-a800-ad7d0c058ab1@perex.cz>
Date: Tue, 18 May 2021 18:25:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210507131139.10231-1-hdegoede@redhat.com>
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

Dne 07. 05. 21 v 15:11 Hans de Goede napsal(a):
> Hi All,
> 
> This series adds support for controlling spk/mic mute LEDs one some Bay-
> and Cherry-Trail devices using the new snd_ctl_led kmod functionality.
> 
> This requires the latest alsa-lib and alsa-utils git code and when
> running on Fedora it also requires putting selinux in permissive mode
> for now. I've filed a bug against the selinux-policy to get this fixed:
> https://bugzilla.redhat.com/show_bug.cgi?id=1958210
> 
> Note the first patch is mostly unrelated, it is a resend of an earlier
> patch which seems to have fallen through the cracks.

Hi,

	I applied all three patches with a minor correction for the latest alsa-lib -
I added the '-' prefix for the /sbin/modprobe to ignore errors when the
snd_ctl_led module does not exists.

				Thank you,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
