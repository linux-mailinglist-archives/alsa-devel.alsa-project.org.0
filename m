Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 127376E31E
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 11:06:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68B32169A;
	Fri, 19 Jul 2019 11:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68B32169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563527209;
	bh=A3ZHXWzKpdYz5s/hgCCW2eLfIy9n56qMdqW6rJlyRb8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HdcfIhxRvi+QZ+O/38tdbgce6e4J0G7ZRhkI5ljv9sU4W2e3RVQCXEOU6FsSvSOyv
	 ZSlt+vILgclrttEBLAQ8FRFvDqBHbKy8QBZBS5LOUATifXzHosePzwBnPxN227Ctz/
	 H0dJuX7PdM+uLCu799W0kMt6uCJ3/Uk1TDvKHCuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C78B5F80367;
	Fri, 19 Jul 2019 11:05:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED75AF80272; Fri, 19 Jul 2019 11:05:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1572F8015B
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 11:04:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1572F8015B
Received: by mail-ot1-f66.google.com with SMTP id d17so32071307oth.5
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 02:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zd5faFZBJ3CISmgf2YB/YasKCKp9nVRBDG44ox519t8=;
 b=JNBXy+PPPXQR9dLncZ1I6FTEjysVCgDm8DxpsrEle20rqiBEonFkyn9Ud60jL9MLjO
 tb4Vnm76nh3Hyo7T8D0XhPWalLhpzxZPu4TMMR8PAx2Y7+hnnjsoQZzsmJhWHw/LsDzk
 C1hYqZzcQeaCyztCGr1qZZJUCllcc/G4djWO7ZyeyoNMqO8cFbvebA944ZPo4R2lMSN7
 +8QLzypye7IwZciTXWYEZqIlkW1aasvVCHRwJDAYYdfFmRppcdDJWJW0fMi73LJthXNo
 giY70/fHF2hpFSb1ty+DXx+jOM6aBl2dUstHNKPoh5/Fg7vAW2mWAINAD04lHgvyZlIJ
 bmCA==
X-Gm-Message-State: APjAAAVefau4Y+THCPSNgwn4eYLfvazLkjaGSVqyJzNx281BxXXPUYGk
 LIke1asndwO/iwdVtHY25LxVqMmVfh+ys/6lAlc=
X-Google-Smtp-Source: APXvYqw0sNqYa7A5oTLf6hn610byHPDW62S2UShb5afT+y/hmGYWKdmjwS/zkDlDyO/fgmeccIszVzI7OynEOTR2hqc=
X-Received: by 2002:a9d:6a4b:: with SMTP id h11mr14400070otn.266.1563527094864; 
 Fri, 19 Jul 2019 02:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190718230215.18675-1-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190718230215.18675-1-pierre-louis.bossart@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 19 Jul 2019 11:04:43 +0200
Message-ID: <CAJZ5v0g5Hk9JYLvRXfLk5-o=n_RVPKtWD=QONpiimCWyQOFELQ@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, jank@cadence.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH] soundwire: fix regmap dependencies and
 align with other serial links
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jul 19, 2019 at 1:02 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> The existing code has a mixed select/depend usage which makes no sense.
>
> config SOUNDWIRE_BUS
>        tristate
>        select REGMAP_SOUNDWIRE
>
> config REGMAP_SOUNDWIRE
>         tristate
>         depends on SOUNDWIRE_BUS
>
> Let's remove one layer of Kconfig definitions and align with the
> solutions used by all other serial links.
>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

No issues found:

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  drivers/base/regmap/Kconfig | 2 +-
>  drivers/soundwire/Kconfig   | 7 +------
>  drivers/soundwire/Makefile  | 2 +-
>  3 files changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
> index 6ad5ef48b61e..8cd2ac650b50 100644
> --- a/drivers/base/regmap/Kconfig
> +++ b/drivers/base/regmap/Kconfig
> @@ -44,7 +44,7 @@ config REGMAP_IRQ
>
>  config REGMAP_SOUNDWIRE
>         tristate
> -       depends on SOUNDWIRE_BUS
> +       depends on SOUNDWIRE
>
>  config REGMAP_SCCB
>         tristate
> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> index 3a01cfd70fdc..f518273cfbe3 100644
> --- a/drivers/soundwire/Kconfig
> +++ b/drivers/soundwire/Kconfig
> @@ -4,7 +4,7 @@
>  #
>
>  menuconfig SOUNDWIRE
> -       bool "SoundWire support"
> +       tristate "SoundWire support"
>         help
>           SoundWire is a 2-Pin interface with data and clock line ratified
>           by the MIPI Alliance. SoundWire is used for transporting data
> @@ -17,17 +17,12 @@ if SOUNDWIRE
>
>  comment "SoundWire Devices"
>
> -config SOUNDWIRE_BUS
> -       tristate
> -       select REGMAP_SOUNDWIRE
> -
>  config SOUNDWIRE_CADENCE
>         tristate
>
>  config SOUNDWIRE_INTEL
>         tristate "Intel SoundWire Master driver"
>         select SOUNDWIRE_CADENCE
> -       select SOUNDWIRE_BUS
>         depends on X86 && ACPI && SND_SOC
>         help
>           SoundWire Intel Master driver.
> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> index fd99a831b92a..45b7e5001653 100644
> --- a/drivers/soundwire/Makefile
> +++ b/drivers/soundwire/Makefile
> @@ -5,7 +5,7 @@
>
>  #Bus Objs
>  soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
> -obj-$(CONFIG_SOUNDWIRE_BUS) += soundwire-bus.o
> +obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
>
>  #Cadence Objs
>  soundwire-cadence-objs := cadence_master.o
> --
> 2.20.1
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
