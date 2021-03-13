Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 249FE339F08
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Mar 2021 17:07:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB9A418FA;
	Sat, 13 Mar 2021 17:06:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB9A418FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615651629;
	bh=I+tXFb4vRJoihUSkMF/I397PuhtuPB97TpmIdj2jc4o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RfwtwORwk37H+wh4rd5TifaHF0DSu/20d36sMThALoQHjXa0vtnHjHngVZrhczN94
	 17pYl1YPA8RbPfuTtmaHH2qL2wnWLx8b8e5g2ML0DmX2zm2TLNX9lA7icHlrvtRgAo
	 idGIcCxDWjVWXAa0Xqu8iCiv3eGXDdKw05M+7ljg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 414C6F8012A;
	Sat, 13 Mar 2021 17:05:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39B47F80227; Sat, 13 Mar 2021 17:05:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFC33F80154
 for <alsa-devel@alsa-project.org>; Sat, 13 Mar 2021 17:05:29 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 922CEA003F;
 Sat, 13 Mar 2021 17:05:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 922CEA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1615651528; bh=7lrSz9+LcpxjDmojAD7DURNhVaEGWfZn+mfYcENaU+Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=4zyQUaD/rnX8A2wI36oFaTEPxbCF+crbtXLRYcuu4lJWcfhHGJBZtFwr1BqqJTeQW
 ZSkL1V7S7MYNKhPsrmIWuSpHCbApwSSKsiMUZEuXS4H6CLUFiMRRUSFWcxBtzkAzC2
 nPd+02rcgSpfexdnaFZRQ3NUa6k9wMtSSVKPrLBE=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat, 13 Mar 2021 17:05:24 +0100 (CET)
Subject: Re: [PATCH alsa-ucm-conf v2 7/7] codecs/rt5640: Specify
 Playback/CaptureMasterElem for HW volume-control
To: Hans de Goede <hdegoede@redhat.com>
References: <20210308220554.76111-1-hdegoede@redhat.com>
 <20210308220554.76111-8-hdegoede@redhat.com>
 <784b0a8e-7308-9b08-c751-4f8571576c13@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <cac481fc-1f99-aeb1-f1f5-7f12430e128f@perex.cz>
Date: Sat, 13 Mar 2021 17:05:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <784b0a8e-7308-9b08-c751-4f8571576c13@redhat.com>
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

Dne 13. 03. 21 v 13:10 Hans de Goede napsal(a):
> Hi,
> 
> On 3/8/21 11:05 PM, Hans de Goede wrote:
>> Newer kernels add "aif:1" or "aif:2" to the components string to let
>> us know which AIF is being used.
>>
>> Use this to specify the correct Playback/CaptureMasterElem for HW
>> volume-control, based on which AIF is being used.
>>
>> On older kernels, where there is no "aif:%d" string in the components
>> string, no Playback/CaptureMasterElem is specified.
>>
>> In DigitalMics.conf the master mixer is used as regular CaptureMixerElem
>> instead of as CaptureMasterElem since the DMICs don't have any analog
>> volume control.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> The kernel side of this patch has landed now, so this patch can
> be merged now.

Merged. Thank you.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
