Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2E03A8060
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 15:37:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B8A01690;
	Tue, 15 Jun 2021 15:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B8A01690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623764267;
	bh=QOtPOR6airNXxiUg8Jeof9z14GNaC4CdBBZFqThEvxM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i4B3/k61mAYoOqSXBegds/POH167VivHIoV1b2tLxNgzFGMLDI98JSFu1fu1l5COt
	 sIUiniakh54yAR5gN6UFs/cupLyyUNjrVg8SDIDn7/7YduK5jfruYqaYn4+aHiafER
	 zBo+EtSRAoElUi9+sgERd9NM4F0Uuhd69qXrzN0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEB1FF8025A;
	Tue, 15 Jun 2021 15:36:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 623DCF80171; Tue, 15 Jun 2021 15:36:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net
 [194.109.24.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AB99F80113
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 15:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AB99F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl
 header.b="rHJ0usjN"
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id t9Eblm3twhqltt9Eflrn3Z; Tue, 15 Jun 2021 15:36:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1623764170; bh=TYZsxWK3pyuuhL9w4imZapk5ZEIWECc0wzFBU2fCKpM=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=rHJ0usjNf3YcqQjumM4sQB8OAegejpxDtk06UkoA9pGImM3uFaLcj013ZiGAsguKR
 b6liFsu0UbsdWl6nssQU3gmm2Tns1QbV05FRdwbVw+WOqIb0xEtLux1N4G9SU8s3Uz
 99ohpaG4eOpWj+0R02QoZ2oJQM8jV53GCLrawzBbviUR6z5+PuP8NCVlfmJeXy6z4Y
 LZhne5wmE8Ut3f68pKbjYNKgR5EkAIy/lSEGlyO5Eal8BrxvsvcPDc+GPhYkIiv3Eu
 73aEdWflfpX9eixE6HcuzRiDK7F4HZYGdSeBmhYdC+MSLtqAXnfQE33K0ZRoYH48xh
 weo7l0YVrfA0A==
Subject: Re: [PATCH] media: Fix Media Controller API config checks
To: Shuah Khan <skhan@linuxfoundation.org>, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com, dan.carpenter@oracle.com,
 mchehab@kernel.org
References: <20210611015849.42589-1-skhan@linuxfoundation.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3745852a-a14d-3e66-dd9f-409ec7e43f48@xs4all.nl>
Date: Tue, 15 Jun 2021 15:36:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210611015849.42589-1-skhan@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIY3fpQsqyTxg/12EwjXTdXJ4H4fQhDvhvUsUDPDNaiFJn7cFHi+oEO5t9qlFvaoCNJitZT/UimCmnJLCJGf9mat5FDlGkx0DTVritfHTWTeawb5H0Qi
 19R0pAfngkCvuuMLWdD/91NTVXYfe15e8v89srtADlTf77TA9YasfbTs1CGh+KtWDLVRvmaen/cK1do/S4crI8Blx85vwD93cRFHyZ+uNSs370zGpEXSBtHt
 K0zFAelyLKtpCadoGqjOMPXXfCijHFMrbE+bE/CHJCUI0DWEQECP9BoIi4WOF6VQqTBCdlJfyJVHjL1Lwqmm01m8aRQ9qslIDkUrd117sWrbO/ZjJuEr/Bp5
 jdFoShJhQTZS3SupGa2qw4xs2eIPo2lDuXUci7wAH17x+OIXM0tRTFrgbEvWzXuCMKoPnmyX5vpgYzA+oZwpuMrgFyc0KhuGLdmKmNSedc0zSMTZeHeCb+26
 VOX5e4xC3D68ah1M
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
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

Hi Shuah,

On 11/06/2021 03:58, Shuah Khan wrote:
> Smatch static checker warns that "mdev" can be null:
> 
> sound/usb/media.c:287 snd_media_device_create()
>     warn: 'mdev' can also be NULL
> 
> If CONFIG_MEDIA_CONTROLLER is disabled, this file should not be included
> in the build.
> 
> The below conditions in the sound/usb/Makefile are in place to ensure that
> media.c isn't included in the build.
> 
> sound/usb/Makefile:
> snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) += media.o
> 
> select SND_USB_AUDIO_USE_MEDIA_CONTROLLER if MEDIA_CONTROLLER &&
>        (MEDIA_SUPPORT=y || MEDIA_SUPPORT=SND_USB_AUDIO)
> 
> The following config check in include/media/media-dev-allocator.h is
> in place to enable the API only when CONFIG_MEDIA_CONTROLLER and
> CONFIG_USB are enabled.
> 
>  #if defined(CONFIG_MEDIA_CONTROLLER) && defined(CONFIG_USB)
> 
> This check doesn't work as intended when CONFIG_USB=m. When CONFIG_USB=m,
> CONFIG_USB_MODULE is defined and CONFIG_USB is not. The above config check
> doesn't catch that CONFIG_USB is defined as a module and disables the API.
> This results in sound/usb enabling Media Controller specific ALSA driver
> code, while Media disables the Media Controller API.
> 
> Fix the problem requires two changes:
> 
> 1. Change the check to use IS_ENABLED to detect when CONFIG_USB is enabled
>    as a module or static. Since CONFIG_MEDIA_CONTROLLER is a bool, leave
>    the check unchanged to be consistent with drivers/media/Makefile.
> 
> 2. Change the drivers/media/mc/Makefile to include mc-dev-allocator.o
>    in mc-objs when CONFIG_USB is y or m.

If I test this patch, then I get:

drivers/media/mc/mc-dev-allocator.c:97:22: error: redefinition of 'media_device_usb_allocate'
   97 | struct media_device *media_device_usb_allocate(struct usb_device *udev,
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/media/mc/mc-dev-allocator.c:24:
include/media/media-dev-allocator.h:55:36: note: previous definition of 'media_device_usb_allocate' was here
   55 | static inline struct media_device *media_device_usb_allocate(
      |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/mc/mc-dev-allocator.c:119:6: error: redefinition of 'media_device_delete'
  119 | void media_device_delete(struct media_device *mdev, const char *module_name,
      |      ^~~~~~~~~~~~~~~~~~~
In file included from drivers/media/mc/mc-dev-allocator.c:24:
include/media/media-dev-allocator.h:59:20: note: previous definition of 'media_device_delete' was here
   59 | static inline void media_device_delete(
      |                    ^~~~~~~~~~~~~~~~~~~

The .config has:

# CONFIG_USB_SUPPORT is not set
CONFIG_MEDIA_CONTROLLER=y

Regards,

	Hans

> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Link: https://lore.kernel.org/alsa-devel/YLeAvT+R22FQ%2FEyw@mwanda/
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>  drivers/media/mc/Makefile           | 2 +-
>  include/media/media-dev-allocator.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/mc/Makefile b/drivers/media/mc/Makefile
> index 119037f0e686..140f0a78540e 100644
> --- a/drivers/media/mc/Makefile
> +++ b/drivers/media/mc/Makefile
> @@ -3,7 +3,7 @@
>  mc-objs	:= mc-device.o mc-devnode.o mc-entity.o \
>  	   mc-request.o
>  
> -ifeq ($(CONFIG_USB),y)
> +ifeq ($(CONFIG_USB),$(filter $(CONFIG_USB),y m))
>  	mc-objs += mc-dev-allocator.o
>  endif
>  
> diff --git a/include/media/media-dev-allocator.h b/include/media/media-dev-allocator.h
> index b35ea6062596..2ab54d426c64 100644
> --- a/include/media/media-dev-allocator.h
> +++ b/include/media/media-dev-allocator.h
> @@ -19,7 +19,7 @@
>  
>  struct usb_device;
>  
> -#if defined(CONFIG_MEDIA_CONTROLLER) && defined(CONFIG_USB)
> +#if defined(CONFIG_MEDIA_CONTROLLER) && IS_ENABLED(CONFIG_USB)
>  /**
>   * media_device_usb_allocate() - Allocate and return struct &media device
>   *
> 

