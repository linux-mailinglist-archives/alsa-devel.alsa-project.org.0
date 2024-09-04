Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2439B96B6A7
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 11:29:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 412B5A4D;
	Wed,  4 Sep 2024 11:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 412B5A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725442191;
	bh=3DYh1e2GuK4obzNV7376qpnjHHx8i2d0t9UfuJpCnq4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O0v613Dh3cpOo1DlO0R1IMITRcYIxsrujTNi6VbIpJBeliY+vWUvgIwWtilDveV2x
	 nuQM/b3cZtKwg8ANnOTCvM3QhUmLppDGoBXXYOZo2sSIcfZJqi9qyDDLqgvLaSz7tQ
	 Zp8o52Ux76O3oy5ovSYmIklpDHqZEfKL4Wyouc80=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E28DF805B5; Wed,  4 Sep 2024 11:29:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8EEEF805A0;
	Wed,  4 Sep 2024 11:29:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CB1EF80199; Wed,  4 Sep 2024 11:29:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DECB7F80027
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 11:29:11 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 14D382EB9;
	Wed,  4 Sep 2024 11:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 14D382EB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1725442150; bh=u6W8y2ZiH4biuWfjJrGxEW01U4Sjv0XzXI3J43x/O5o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rM1SrenwfwHqyhwqccNr3DQdWL/3qY4sAiYsVqWNBEgKbugx8OJydxTaYO6ND2e/x
	 cpm3cDx2CBDkszlVMV4/+FRRfjZSBoHgehMChA25h61jZViF2Ltei1jyWp8nLXyyJf
	 Y/vF7JcN+DEQ8tvRInDyyBKYs+cB88vCtTRl2HHw=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed,  4 Sep 2024 11:29:05 +0200 (CEST)
Message-ID: <403ab960-ee4f-404a-81ab-e63d4a7f7ef9@perex.cz>
Date: Wed, 4 Sep 2024 11:29:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Suspend/resume Issue on pcm_dmix.c in alsa-lib
To: Chancel Liu <chancel.liu@nxp.com>, Takashi Iwai <tiwai@suse.de>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "S.J. Wang" <shengjiu.wang@nxp.com>
References: 
 <DB9PR04MB94988752ED7C43B399E0BC00E3942@DB9PR04MB9498.eurprd04.prod.outlook.com>
 <87msky1bqh.wl-tiwai@suse.de>
 <DB9PR04MB9498F7BBF2688256DEE7D5F2E39C2@DB9PR04MB9498.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
Autocrypt: addr=perex@perex.cz; keydata=
 xsFNBFvNeCsBEACUu2ZgwoGXmVFGukNPWjA68/7eMWI7AvNHpekSGv3z42Iy4DGZabs2Jtvk
 ZeWulJmMOh9ktP9rVWYKL9H54gH5LSdxjYYTQpSCPzM37nisJaksC8XCwD4yTDR+VFCtB5z/
 E7U0qujGhU5jDTne3dZpVv1QnYHlVHk4noKxLjvEQIdJWzsF6e2EMp4SLG/OXhdC9ZeNt5IU
 HQpcKgyIOUdq+44B4VCzAMniaNLKNAZkTQ6Hc0sz0jXdq+8ZpaoPEgLlt7IlztT/MUcH3ABD
 LwcFvCsuPLLmiczk6/38iIjqMtrN7/gP8nvZuvCValLyzlArtbHFH8v7qO8o/5KXX62acCZ4
 aHXaUHk7ahr15VbOsaqUIFfNxpthxYFuWDu9u0lhvEef5tDWb/FX+TOa8iSLjNoe69vMCj1F
 srZ9x2gjbqS2NgGfpQPwwoBxG0YRf6ierZK3I6A15N0RY5/KSFCQvJOX0aW8TztisbmJvX54
 GNGzWurrztj690XLp/clewmfIUS3CYFqKLErT4761BpiK5XWUB4oxYVwc+L8btk1GOCOBVsp
 4xAVD2m7M+9YKitNiYM4RtFiXwqfLk1uUTEvsaFkC1vu3C9aVDn3KQrZ9M8MBh/f2c8VcKbN
 njxs6x6tOdF5IhUc2E+janDLPZIfWDjYJ6syHadicPiATruKvwARAQABzSBKYXJvc2xhdiBL
 eXNlbGEgPHBlcmV4QHBlcmV4LmN6PsLBjgQTAQgAOBYhBF7f7LZepM3UTvmsRTCsxHw/elMJ
 BQJbzXgrAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEDCsxHw/elMJDGAP/ReIRiRw
 lSzijpsGF/AslLEljncG5tvb/xHwCxK5JawIpViwwyJss06/IAvdY5vn5AdfUfCl2J+OakaR
 VM/hdHjCYNu4bdBYZQBmEiKsPccZG2YFDRudEmiaoaJ1e8ZsiA3rSf4SiWWsbcBOYHr/unTf
 4KQsdUHzPUt8Ffi9HrAFzI2wjjiyV5yUGp3x58ZypAIMcKFtA1aDwhA6YmQ6lb8/bC0LTC6l
 cAAS1tj7YF5nFfXsodCOKK5rKf5/QOF0OCD2Gy+mGLNQnq6S+kD+ujQfOLaUHeyfcNBEBxda
 nZID7gzd65bHUMAeWttZr3m5ESrlt2SaNBddbN7NVpVa/292cuwDCLw2j+fAZbiVOYyqMSY4
 LaNqmfa0wJAv30BMKeRAovozJy62j0AnntqrvtDqqvuXgYirj2BEDxx0OhZVqlI8o5qB6rA5
 Pfp2xKRE8Fw3mASYRDNad08JDhJgsR/N5JDGbh4+6sznOA5J63TJ+vCFGM37M5WXInrZJBM3
 ABicmpClXn42zX3Gdf/GMM3SQBrIriBtB9iEHQcRG/F+kkGOY4QDi4BZxo45KraANGmCkDk0
 +xLZVfWh8YOBep+x2Sf83up5IMmIZAtYnxr77VlMYHDWjnpFnfuja+fcnkuzvvy7AHJZUO1A
 aKexwcBjfTxtlX4BiNoK+MgrjYywzsFNBFvNeCsBEACb8FXFMOw1g+IGVicWVB+9AvOLOhqI
 FMhUuDWmlsnT8B/aLxcRVUTXoNgJpt0y0SpWD3eEJOkqjHuvHfk+VhKWDsg6vlNUmF1Ttvob
 18rce0UH1s+wlE8YX8zFgODbtRx8h/BpykwnuWNTiotu9itlE83yOUbv/kHOPUz4Ul1+LoCf
 V2xXssYSEnNr+uUG6/xPnaTvKj+pC7YCl38Jd5PgxsP3omW2Pi9T3rDO6cztu6VvR9/vlQ8Z
 t0p+eeiGqQV3I+7k+S0J6TxMEHI8xmfYFcaVDlKeA5asxkqu5PDZm3Dzgb0XmFbVeakI0be8
 +mS6s0Y4ATtn/D84PQo4bvYqTsqAAJkApEbHEIHPwRyaXjI7fq5BTXfUO+++UXlBCkiH8Sle
 2a8IGI1aBzuL7G9suORQUlBCxy+0H7ugr2uku1e0S/3LhdfAQRUAQm+K7NfSljtGuL8RjXWQ
 f3B6Vs7vo+17jOU7tzviahgeRTcYBss3e264RkL62zdZyyArbVbK7uIU6utvv0eYqG9cni+o
 z7CAe7vMbb5KfNOAJ16+znlOFTieKGyFQBtByHkhh86BQNQn77aESJRQdXvo5YCGX3BuRUaQ
 zydmrgwauQTSnIhgLZPv5pphuKOmkzvlCDX+tmaCrNdNc+0geSAXNe4CqYQlSnJv6odbrQlD
 Qotm9QARAQABwsF2BBgBCAAgFiEEXt/stl6kzdRO+axFMKzEfD96UwkFAlvNeCsCGwwACgkQ
 MKzEfD96Uwlkjg/+MZVS4M/vBbIkH3byGId/MWPy13QdDzBvV0WBqfnr6n99lf7tKKp85bpB
 y7KRAPtXu+9WBzbbIe42sxmWJtDFIeT0HJxPn64l9a1btPnaILblE1mrfZYAxIOMk3UZA3PH
 uFdyhQDJbDGi3LklDhsJFTAhBZI5xMSnqhaMmWCL99OWwfyJn2omp8R+lBfAJZR31vW6wzsj
 ssOvKIbgBpV/o3oGyAofIXPYzhY+jhWgOYtiPw9bknu748K+kK3fk0OeEG6doO4leB7LuWig
 dmLZkcLlJzSE6UhEwHZ8WREOMIGJnMF51WcF0A3JUeKpYYEvSJNDEm7dRtpb0x/Y5HIfrg5/
 qAKutAYPY7ClQLu5RHv5uqshiwyfGPaiE8Coyphvd5YbOlMm3mC/DbEstHG7zA89fN9gAzsJ
 0TFL5lNz1s/fo+//ktlG9H28EHD8WOwkpibsngpvY+FKUGfJgIxpmdXVOkiORWQpndWyRIqw
 k8vz1gDNeG7HOIh46GnKIrQiUXVzAuUvM5vI9YaW3YRNTcn3pguQRt+Tl9Y6G+j+yvuLL173
 m4zRUU6DOygmpQAVYSOJvKAJ07AhQGaWAAi5msM6BcTU4YGcpW7FHr6+xaFDlRHzf1lkvavX
 WoxP1IA1DFuBMeYMzfyi4qDWjXc+C51ZaQd39EulYMh+JVaWRoY=
In-Reply-To: 
 <DB9PR04MB9498F7BBF2688256DEE7D5F2E39C2@DB9PR04MB9498.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6HEBI45X5XBXHUGHFLWP7LYAQPFE52RJ
X-Message-ID-Hash: 6HEBI45X5XBXHUGHFLWP7LYAQPFE52RJ
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6HEBI45X5XBXHUGHFLWP7LYAQPFE52RJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04. 09. 24 11:07, Chancel Liu wrote:
> Hi Takashi,
> 
> Thanks for your reply and suggestions. Finally we have found the root cause.
> Seems it's related to both drivers and alsa-lib.
> 
> When two dmix clients run in parallel we get two direct dmix instances.
> 1st dmix instance:
> snd_pcm_dmix_open()
> 	snd_pcm_direct_initialize_slave()
> 		save_slave_setting()
> Since the driver we are using has SND_PCM_INFO_RESUME flag, dmix->spcm->info
> has this flag. Then this flag is cleared in dmix->shmptr->s.info.
> 		
> 2nd dmix instance:
> snd_pcm_dmix_open()
> 	snd_pcm_direct_open_secondary_client()
> 		copy_slave_setting()
> 2nd dmix->spcm->info is copied from dmix->shmptr->s.info so it doesn' has this
> flag.
> 
> If 1st dmix instance resumes firstly it should implement recovery of slave pcm
> in snd_pcm_direct_slave_recover(). Because 1st dmix->spcm->info has
> SND_PCM_INFO_RESUME，snd_pcm_resume(direct->spcm) can be called correctly to
> resume slave pcm.
> 
> However if 2nd dmix instance resumes firstly, snd_pcm_resume(direct->spcm) will
> not be called because it's spcm->info doesn't has SND_PCM_INFO_RESUME flag. The
> 1st dmix instance assumes someone else already did recovery so
> snd_pcm_resume(direct->spcm) won't be called neither. In result the slave pcm
> fails to resume.

The snd_pcm_direct_slave_recover() function should be called for both dmix 
instances. It calls snd_pcm_prepare() for the "driver" PCM, so the driver 
should recover from suspend in this case, too.

See the "some buggy drivers" comment in snd_pcm_direct_slave_recover(). It 
looks like a driver issue, the "resume" flag mangling is just a workaround.

> SND_PCM_INFO_RESUME flag has impact on the flow of dmix resume. In my opinion
> the first resumed dmix instance should make sure slave pcm can be recovered
> properly no matter it's the first opened instance or secondary opened instance.
> Do you know why the secondary opened instance clear the SND_PCM_INFO_RESUME
> flag? Can we do the following modification?
> 
> diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
> @@ -1183,8 +1226,6 @@ static void save_slave_setting(snd_pcm_direct_t *dmix, snd_pcm_t *spcm)
>          COPY_SLAVE(buffer_time);
>          COPY_SLAVE(sample_bits);
>          COPY_SLAVE(frame_bits);
> -
> -       dmix->shmptr->s.info &= ~SND_PCM_INFO_RESUME;

Another option is to fix the buggy drivers and remove the workround (or make 
it configurable) from alsa-lib (revert commit 
6d1d620eadf32c6d963468ce56ff52cc3a2f32e2).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

