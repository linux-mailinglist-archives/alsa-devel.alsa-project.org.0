Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE10443CFA4
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 19:26:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8C2B169F;
	Wed, 27 Oct 2021 19:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8C2B169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635355619;
	bh=ZUeiPZa6n2J/N9xqVGmWqkC+gNcPR2QfkLPXhdq7x94=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GRhBg0j7RZL5xhBjca8E2Tb1cWainIx5EJCiQh5FwkDxCF0H667EeWgqmtkA0kgCe
	 VwhBF0Wyl/Ek9XJ7YWXoYlQhMrEjQ1aNDb0oTFRaVFH/CBZLbfZ/MVP5/xzHemMoSj
	 JFk4tguh6nOEwQrgnc760BeYgDNzbIk/6tOC+kbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A5D8F8010A;
	Wed, 27 Oct 2021 19:25:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAE65F8025A; Wed, 27 Oct 2021 19:25:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB008F8010A
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 19:25:33 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4EF17A0040;
 Wed, 27 Oct 2021 19:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4EF17A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1635355532; bh=2Jo5cGI5SCR0+/CjnCp+O018CY5GYMdbsCvNpWf0pic=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=YtI5R0J7+DS4RHPfMSj5n67PG7RYdOAjrXXukCGW8ojekFs2IFxjrntLfiYg7f8mp
 m5lu2+B+LqEW1SjmjBdibZF5K1CgfqduV/b7oYjQJitbddl1WzXIK84VA8NzWhLpI4
 85MUmtG8AxLLyGIBNziCCkesgJyAnhwMDYQKD/Wo=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 27 Oct 2021 19:25:30 +0200 (CEST)
Message-ID: <e7de13ce-ee03-761d-0890-527bd00883e3@perex.cz>
Date: Wed, 27 Oct 2021 19:25:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH alsa-utils] alsactl: Add --quiet option to suppress
 alsa-lib error messages
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20211027144008.27002-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20211027144008.27002-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On 27. 10. 21 16:40, Takashi Iwai wrote:
> alsactl prints error messages from alsa-lib as is, and it's rather
> annoying to see the error messages like
> 
>    alsactl[xxx]: alsa-lib parser.c:242:(error_node) UCM is not supported for this HDA model (HDA Intel PCH...)
>    alsactl[xxx]: alsa-lib main.c:1405:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -6
> 
> that are recorded in the syslog at each boot.
> 
> This patch adds --quiet (or -q) option to suppress those error
> messages from alsa-lib, and applies to the systemd services as
> default.

The fix is inaccurate as it's just a warning not an error. The question is, 
how to signal those warnings to users to eliminate the confusion.

The suppression of all alsa-lib errors does not seem like a good idea to me.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
