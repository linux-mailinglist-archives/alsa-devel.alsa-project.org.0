Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EE333F974
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 20:39:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1721416C3;
	Wed, 17 Mar 2021 20:38:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1721416C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616009973;
	bh=/MeUJsXI3vY0jmVkL6zr3AlJZBeB/3Uhk6J2sHKHMnM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DJNl607BX/nvzSGz2Asg33/dexSNog4zlf8+/mq87KorQXpSvyJFLPu1AZJUNxVL8
	 QiFxfrnKYULkYwyCqGBWivS6g+rgRjsNWyA7OhdRM9yhepF52fBTLS8RBD+WnWN/W+
	 8H687uAaSBXTgbD7daFI8gPz0rDsgPUBQxvn8QMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81530F8023C;
	Wed, 17 Mar 2021 20:38:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 553DCF8021C; Wed, 17 Mar 2021 20:38:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4264DF80148
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 20:37:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4264DF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cxUtmVji"
Received: by mail-qk1-x734.google.com with SMTP id l4so40171331qkl.0
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 12:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=/MeUJsXI3vY0jmVkL6zr3AlJZBeB/3Uhk6J2sHKHMnM=;
 b=cxUtmVjiMGWSWEl9OQIaV4+m0QANUEt/HgIwSPfINPod5lcP20pI5jXuVDzAC7zsSE
 mFLBbMiAKOYTdL/b4OJLxKLcUCQQxHWOVVOUyo1Vus3mgRoiXiC49Ezzv0VZPQOScUP/
 gqU33xHYK7Rhe+JGgJB0JwsyOC9wklOlpvX/tWvNvx41vWti+ZogG80RMzVo8iFLTE8G
 cWPIu5+8q1zQRgriiZCwip0R9/5lKrtM958X0iI5O+4bnAoMYoCtr+CCIbwzLNGnLgR7
 FZsMfW/vqiqt4+nxtG5MxqU+W0WTTWvPK2ncU6eVawLF1NEvMFG76xjGlgosDzyCblQ+
 h+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=/MeUJsXI3vY0jmVkL6zr3AlJZBeB/3Uhk6J2sHKHMnM=;
 b=kL2zqw3U4PErn9YsbC5Ybo6yCSL2l3nnCoqj2uhJgAVXraja8hKqMTDEK/ROCW64Te
 2RUmbj4VxYv6QhqnZwRNJFO0jLMGcJc7rrmyq5uBKj26Ulau0u8Z8cwX/93y85/j3fQ6
 fd1JhDK9w9jkTR58xDW0K4hnDnvrJJR415FURr7tL/i8AyFwCQCkVz6Fm57LBs+hYvFs
 ha/m5wsUFFKO6sf/OtAh6Lh0g9oWhZ9Rk4L2tRyB+tju0ATFicl5RLQ+raTX2SlF2NQ4
 Dx88KiG7OFEK6TixMqO4fC/+WpZzKy8cSPqZHxvjfpq23Xabaf6+FsRIhpZJGz5pVjt7
 2Wlg==
X-Gm-Message-State: AOAM533PvUb6zkSE3j2qoBcv8W+MF9UluxPwioENdlDNipLyW8CJwnQ5
 eL4wSk7n/zSQd/bxB3ifgzo=
X-Google-Smtp-Source: ABdhPJwAhAV0sOEnWkPloIiGnv1JuMXHHMQujxONTz4xfa9vJ9JBExvkKj2rAE3Ace3der2Bn+3EGA==
X-Received: by 2002:a37:8584:: with SMTP id h126mr831792qkd.41.1616009873965; 
 Wed, 17 Mar 2021 12:37:53 -0700 (PDT)
Received: from ArchLinux ([156.146.37.138])
 by smtp.gmail.com with ESMTPSA id a19sm18520611qkl.126.2021.03.17.12.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 12:37:53 -0700 (PDT)
Date: Thu, 18 Mar 2021 01:07:35 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] sound: soc: ti: Fix a typo in the file ams-delta.c
Message-ID: <YFJaf+Q1P1nnvJm/@ArchLinux>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Mark Brown <broonie@kernel.org>, peter.ujfalusi@gmail.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
References: <20210317082042.3670745-1-unixbhaskar@gmail.com>
 <20210317123411.GA5559@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jZ3NNrf+z32CQz8F"
Content-Disposition: inline
In-Reply-To: <20210317123411.GA5559@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, peter.ujfalusi@gmail.com
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


--jZ3NNrf+z32CQz8F
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 12:34 Wed 17 Mar 2021, Mark Brown wrote:
>On Wed, Mar 17, 2021 at 01:50:42PM +0530, Bhaskar Chowdhury wrote:
>>
>> s/functonality/functionality/
>
>Please submit patches using subject lines reflecting the style for the
>subsystem, this makes it easier for people to identify relevant patches.
>Look at what existing commits in the area you're changing are doing and
>make sure your subject lines visually resemble what they're doing.
>There's no need to resubmit to fix this alone.

Thanks, will remind myself next time I will try to do the same. But, I was
trying to be "As explicit as possible" , so the person in charge can struggle less and hover less to understand what it is for. Anyway, will follow.

--jZ3NNrf+z32CQz8F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBSWn8ACgkQsjqdtxFL
KRVhngf/Rn/HLqNf0yP0B0rKM2zCM+2si8XQXQyEo0b3gGDfWMMFzSijJkzoBQd8
yFG+7GqW6m4l0tzyrCrmgR1k9A4KpH2p8G/QSF9pN9zRcE7rQKf2YXhWj0ihmNEw
+F3XnFmznP/CiAUMkJbwunVqG3Q0ftBown+naXK7HN73rSfMOcG1SOV8w1pikfMw
XOJqoUl5fSCT2ZDR5l/ZYA5SjFxygKl/M4ufLwdXSqtFNjaGRfXmYS+s5JKpWTZo
0jlm90IWfBocRCTiFX+e4rvaJzvuhoYQiFWq9tPMZK2YborZHxJAGHEf7E+5TeqB
2QWShsiDR7JzR9X7Qk6FkTP88lngPQ==
=IxBi
-----END PGP SIGNATURE-----

--jZ3NNrf+z32CQz8F--
