Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7E33132AB
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 13:45:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FE2085D;
	Mon,  8 Feb 2021 13:44:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FE2085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612788324;
	bh=RQfokB3kG1/mBpfaU6sYq5p075g8dqJgfG/Grn6BJww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ibF/pt4ejJuBMJoo5sUrtUbkqKs1/qUPtHlXdaGwJx5y+MyWDd3iHyGH1aw6TWKpI
	 TXUUx4M5XlIKsY4pUVD1abJoC27PHhfn5DIjy8jTLHTIu+BApNe3Vw8fM3jCRxq5YX
	 WNJUyIIJOpwsIhGzp692EYKqfJw+Qj9CAA+/zvMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5770EF8013A;
	Mon,  8 Feb 2021 13:43:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0615F8022D; Mon,  8 Feb 2021 13:43:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29939F80165
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 13:43:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29939F80165
Received: by mail-ot1-f53.google.com with SMTP id k10so11661846otl.2
 for <alsa-devel@alsa-project.org>; Mon, 08 Feb 2021 04:43:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8HAzaz/gp8Ny3U3vTeQA+VApcyhTcxZN/39VG1rw62k=;
 b=tsE/t2H0ygG/cJnEXq/6shjApeuOd8Jd8xK+soDXZv3BuHq6V8Aen5ZqnMaYzXiMkn
 pG9MAou+Yv8ccr69Z26BvcQXFoLl57rEyXn96BqZ6xWyiG/g4NE7UJziZQOMhyHf+pl9
 7jkk03qQ7XLXsV1Ptls4yLVY8KQxTHwU1Np8oMxxpyWrc1DIZl9VcA3M8aE+HTLCOWYE
 HQtbOr07yrx/X4NmDtXIpNqafXoTw+VaII2EYP/X1YH//StMeDAGfvwuRi+QalqieNG2
 DBSFWqCg4OZ0bkGBQYummw9wlGAvZwexFPq3rjH2LQTmKSmaoIuqPT3WohliLJdHctEh
 VBcA==
X-Gm-Message-State: AOAM532CpRuPnq0AZkSYy2ZgK+1LP56ChKNUo1w+v6rETl3bxBT5LAVI
 7R5OVBSGWeDNZnRE2dt85pLP5Cl+jpeY8F1lnnQ=
X-Google-Smtp-Source: ABdhPJyaocC2wPjxtuBfb3tJQyp9gfJbIpUQFwdV8WVqECi83WVtLzs81p+E1k2jfFBg9ipQnByYuf8GinCabEjq0hY=
X-Received: by 2002:a05:6830:1481:: with SMTP id
 s1mr952387otq.206.1612788221158; 
 Mon, 08 Feb 2021 04:43:41 -0800 (PST)
MIME-Version: 1.0
References: <a3f01a5d-d7a5-8280-4091-b2486b01a782@linux.intel.com>
 <20210208120104.204761-1-marcin.slusarz@gmail.com>
 <20210208120104.204761-2-marcin.slusarz@gmail.com>
In-Reply-To: <20210208120104.204761-2-marcin.slusarz@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Feb 2021 13:43:25 +0100
Message-ID: <CAJZ5v0jSqmpnbpahGBRSjddOecqA1f-9GfvNwjdV0pH7xQ3iVg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ACPICA: update documentation of acpi_walk_namespace
To: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Erik Kaneda <erik.kaneda@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Robert Moore <robert.moore@intel.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>, marcin.slusarz@intel.com,
 Salvatore Bonaccorso <carnil@debian.org>
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

On Mon, Feb 8, 2021 at 1:01 PM Marcin =C5=9Alusarz <marcin.slusarz@gmail.co=
m> wrote:
>
> From: Marcin =C5=9Alusarz <marcin.slusarz@intel.com>
>
> Signed-off-by: Marcin =C5=9Alusarz <marcin.slusarz@intel.com>

A changelog would be appreciated, something like "Make the
documentation match the code and add a note regarding the return
values of the callback function and the walk to it".

Anyway, this is ACPICA material, so it should go to Erik & Bob (CCed).

Thanks!

> ---
>  drivers/acpi/acpica/nsxfeval.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/acpi/acpica/nsxfeval.c b/drivers/acpi/acpica/nsxfeva=
l.c
> index f9d059647cc5..7149c8f70a6e 100644
> --- a/drivers/acpi/acpica/nsxfeval.c
> +++ b/drivers/acpi/acpica/nsxfeval.c
> @@ -532,8 +532,8 @@ static void acpi_ns_resolve_references(struct acpi_ev=
aluate_info *info)
>   *              return_value        - Location where return value of
>   *                                    user_function is put if terminated=
 early
>   *
> - * RETURNS      Return value from the user_function if terminated early.
> - *              Otherwise, returns NULL.
> + * RETURNS      Returns status from the callback function if terminated =
early.
> + *              Otherwise, returns a status of the walk, AE_OK if succee=
ded.
>   *
>   * DESCRIPTION: Performs a modified depth-first walk of the namespace tr=
ee,
>   *              starting (and ending) at the object specified by start_h=
andle.
> @@ -542,6 +542,11 @@ static void acpi_ns_resolve_references(struct acpi_e=
valuate_info *info)
>   *              a non-zero value, the search is terminated immediately a=
nd this
>   *              value is returned to the caller.
>   *
> + *              Note that both the callback functions and the walk itsel=
f
> + *              use overlapping return values (e.g. AE_OK), so user of t=
his
> + *              function can't rely only on the return value to tell if
> + *              the callback function was called.
> + *
>   *              The point of this procedure is to provide a generic name=
space
>   *              walk routine that can be called from multiple places to
>   *              provide multiple services; the callback function(s) can =
be
> --
> 2.25.1
>
