Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2C04A7377
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 15:44:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4994D1740;
	Wed,  2 Feb 2022 15:43:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4994D1740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643813045;
	bh=nlrTMqSDQr6yzWfUvCUWL+GBSBHFcLaCvlFZJZf/ag8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ki3/wtrfG9Hm7aHiVzK6QXxYNDqWwTXAbzcVVQwyuLn3ca2a9qqpE8WHuYh6itO5F
	 deEmyOPOno1Xrh4jL2bBHKUfBUbKpfHUGSUjvA20FWYFU1kBbD+0oWXkOAcaoDsE3I
	 XUiP3iu4YbLbv9I7o0fyWrgz0GhctOXF6ZQ7tvHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C96E0F804B1;
	Wed,  2 Feb 2022 15:42:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B6F3F804B1; Wed,  2 Feb 2022 15:42:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61C2CF80130
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 15:42:51 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8ED1AA0046;
 Wed,  2 Feb 2022 15:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8ED1AA0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1643812970; bh=iQb9T/tWOPeYEpN4C4pwSOdLCsO5xelpAVEo95Njk7M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Yuk1poWXc6cYQuLYibtUU31Bh9MbNbR8jf7moEFZUX4hRu7ZVqqF5RSKiKSFBYrTg
 kghSXmGck6gEnHMmKKWe33rYI52DTkb/NUGTNYsRy+TE1IrouY+Uih03FyGeegRZfw
 XQNrJseOyKlN73EGnd7m8bxqhz50vyEudi4B0GBE=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  2 Feb 2022 15:42:43 +0100 (CET)
Message-ID: <af7680e0-2c76-c625-a761-02d6e1d08c9d@perex.cz>
Date: Wed, 2 Feb 2022 15:42:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/2] kselftest: alsa: Check for event generation when
 we write to controls
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
References: <20220202141011.14924-1-broonie@kernel.org>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220202141011.14924-1-broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kselftest@vger.kernel.org
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

On 02. 02. 22 15:10, Mark Brown wrote:
> Add some coverage of event generation to mixer-test. Rather than doing a
> separate set of writes designed to trigger events we add a step to the
> existing write_and_verify() which checks to see if the value we read back
> from non-volatile controls matches the value before writing and that an
> event is or isn't generated as appropriate. The "tests" for events then
> simply check that no spurious or missing events were detected. This avoids
> needing further logic to generate appropriate values for each control type
> and maximises coverage.
> 
> When checking for events we use a timeout of 0. This relies on the kernel
> generating any event prior to returning to userspace when setting a control.
> That is currently the case and it is difficult to see it changing, if it
> does the test will need to be updated. Using a delay of 0 means that we
> don't slow things down unduly when checking for no event or when events
> fail to be generated.
> 
> We don't check behaviour for volatile controls since we can't tell what
> the behaviour is supposed to be for any given control.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

...

> +		/* The ID returned from the event is 1 less than numid */
> +		mask = snd_ctl_event_elem_get_mask(event);
> +		ev_id = snd_ctl_event_elem_get_numid(event);
> +		if (ev_id != snd_ctl_elem_info_get_numid(ctl->info)) {
> +			ksft_print_msg("Event for unexpected ctl %s\n",
> +				       snd_ctl_event_elem_get_name(event));
> +			continue;
> +		}
> +	} while ((mask & SND_CTL_EVENT_MASK_VALUE) != SND_CTL_EVENT_MASK_VALUE);

A special check for SND_CTL_EVENT_MASK_REMOVE (~0U) is missing here.

For the rest:

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

					Thanks,
						Jaroslav

--
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
