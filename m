Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4868D3477DB
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 13:07:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EF5E1678;
	Wed, 24 Mar 2021 13:06:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EF5E1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616587623;
	bh=MBLKFHhI3N2jnjA1cHwdFTvKmK4U4Lm1Cjsup9MP2eQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g3cNGXRDYNuDZSuuQo2es9YP7UTFux47R9NUVm2kkH2mt50uGaQdL/KX3s3aMa2nd
	 6c0TV5iO+7j27BBUhgFLzrcTdhDPZkG+9X6LSdBfm1B4o7GG9UJoMMBuYh1E9G0rFo
	 Hkk2HafZN8dora6jXDfwaOyNaHWuOHYnSumL1U8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8932F80156;
	Wed, 24 Mar 2021 13:05:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F416F8016B; Wed, 24 Mar 2021 13:05:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DYN_RDNS_AND_INLINE_IMAGE,HTML_MESSAGE,NICE_REPLY_A,
 PRX_APP_IMAGE_PNG,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.d-sys.org (70-31-180-213.sta.estpak.ee [213.180.31.70])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AE5EF800FF
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 13:05:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AE5EF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee
 header.b="enLYlb3Y"; 
 dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee
 header.b="VldZ4HTe"
Received: from mail.d-sys.org (localhost [127.0.0.1])
 by mail.d-sys.org (Postfix) with ESMTP id 9760A60C47;
 Wed, 24 Mar 2021 14:05:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-systems.ee; s=mail;
 t=1616587527; bh=SkwzTh8yrdqriQuUanVneW3UEuJfiLkP5cRnSLuIrkY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=enLYlb3YchJTMhx13cWndDg1KISIZxskUui+F1ETNae+NMCFB+CUjoh1vMlIP9p5y
 9SoW1JtzcPqDmzJaIsYgJHLSFP6NFLWYJbgDDUfNAFbsDWQ98qS73LeiyIkw2lITAM
 1GoBHbs7HAtpGPKDBbfOEbBmJ17+krOy75f9+o0U/jbI4/imJ7yBW3wkhTxeK2/1fO
 UbsnbOgOb5LaRPM8DlGKbjV4iwAaVivuMaP+Ihey09N6Uh1QEHQDe2jsr+7RLgrncj
 A5VBK8IL0cf0jiwUYG7FWVcO1hCavN+QL5+k2w397CylnzJ7Su5Vxb2XQpcXrKUn/s
 z1pKiLwz4PuDw==
Received: from [10.255.10.80] (GW.ds.local [10.255.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 (Authenticated sender: dmitry@d-systems.ee)
 by mail.d-sys.org (Postfix) with ESMTPSA id 329C960A59;
 Wed, 24 Mar 2021 14:05:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-systems.ee; s=mail;
 t=1616587526; bh=SkwzTh8yrdqriQuUanVneW3UEuJfiLkP5cRnSLuIrkY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=VldZ4HTePNjn5VADZbROy5B2J1mUa02bcWrXMMlt5jXq6OPDTh9D4MVMSIIy/gNyz
 zUFReV0f7pFBg2zkKxKmP68yfR/f9Epo5XC1kFBq50oVdYZPDCPrkaam8zgQWyoqCm
 yyUpTf0XmbDD/8txRi1cugWfPdZYd4IQ686jGPWh9MT3lieoZaGhx4lzX7mf+aCk0m
 SserP9cg5SAD1SBHIQmBksRi+mbX1ODc5+pJIghp8KvkuMPzRb+LkzI3UCTieLji4K
 dBJEfi3/38+MptoEh+PnioeOUy3cNFYnmz75nIlnWm/s4KVtQceLwdfbFG8i7U193N
 Lty+M47BEGduw==
Subject: Re: [PATCH] ALSA: usb-audio: Apply sample rate quirk to Logitech
 Connect
To: Ikjoon Jang <ikjn@chromium.org>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
References: <20210324105153.2322881-1-ikjn@chromium.org>
 <c21de867cf4ccbfcc8cf555c78dc70dd3a47dfe8.camel@infinera.com>
 <CAATdQgDrri-tMtu3AOFRcbGHfL6hONDfdMdZh45BusbdAoWfdw@mail.gmail.com>
From: Dmitry Panchenko | d-Systems <dmitry@d-systems.ee>
Message-ID: <62a2ff2e-183f-1aeb-a4a0-d0d57b976179@d-systems.ee>
Date: Wed, 24 Mar 2021 14:05:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAATdQgDrri-tMtu3AOFRcbGHfL6hONDfdMdZh45BusbdAoWfdw@mail.gmail.com>
Content-Language: en-GB
X-AV-Checked: ClamAV using ClamSMTP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: linux-kernel@vger.kernel, alsa-devel@alsa-project.org,
 Dylan Robinson <dylan_robinson@motu.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Alexander Tsoy <alexander@tsoy.me>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Gregor Pintar <grpintar@gmail.com>, Olivia Mackintosh <livvy@base.nu>,
 open list <linux-kernel@vger.kernel.org>
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

Dear list administrator,

please remove dmitry@d-systems.ee from this list.

Kind regards,
Dmitry Panchenko

d-Systems OÜ
Ⓐ Lai 6, Tartu 51005, Estonia
Ⓦ www.d-systems.ee <http://www.d-systems.ee>

On 24.03.21 14:03, Ikjoon Jang wrote:
>
>
> On Wed, Mar 24, 2021, 7:16 PM Joakim Tjernlund 
> <Joakim.Tjernlund@infinera.com <mailto:Joakim.Tjernlund@infinera.com>> 
> wrote:
>
>     On Wed, 2021-03-24 at 18:51 +0800, Ikjoon Jang wrote:
>     > Logitech ConferenceCam Connect is a compound USB device with UVC and
>     > UAC. Not 100% reproducible but sometimes it keeps responding
>     STALL to
>     > every control transfer once it receives get_freq request.
>     >
>     > This patch adds 046d:0x084c to a snd_usb_get_sample_rate_quirk list.
>     >
>     > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=203419
>     > Signed-off-by: Ikjoon Jang <ikjn@chromium.org
>     <mailto:ikjn@chromium.org>>
>
>     Most Logitech USB headset I got needs a delay in
>     snd_usb_ctl_msg_quirk()
>     Have you tried to add say 20 ms delay in there?
>
>
> I didn't try that. But it sounds reasonable to me.
>
> let me try that quirk here. If that is the case, HID might need that 
> delay also. Logitech Group webcam had a similar problem on control 
> xfer of get_report from an another interface for HID.
>
> And 20ms can be too long if it's applied to every control transfer. I 
> will test the device with shorter delay if you didn't try it before.
>
> Any additional advice is welcome.
>
> Thanks!
>
>      Jocke
>

