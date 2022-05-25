Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE2F5364A9
	for <lists+alsa-devel@lfdr.de>; Fri, 27 May 2022 17:29:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A11C7174D;
	Fri, 27 May 2022 17:28:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A11C7174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653665371;
	bh=+a5bWW8q7NNyPFk7FULq9nMMJqviFlae+yYwuY9kM/U=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wtbza/s50UX4xR7U4AYODRdDxQbgAwV7AzSb9BG04u0/TNF1PVmzGGKTiKuFARjJi
	 lN72r+GBFP+9us82gWpURbyeoh6t2ThgcLvGSp0/Ak6Y2lurSaLohrbAyJVAloB0oQ
	 MczsnlyM7KLGoE5OQfOiPu4Sgc7I2yF+yiwGlFyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66090F800D0;
	Fri, 27 May 2022 17:28:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D78FEF8016D; Thu, 26 May 2022 00:07:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_125,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C20F1F80100
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 00:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C20F1F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com
 header.b="eopDrfIH"
Received: by mail-wm1-x330.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so81473wmz.2
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 15:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Q7sKJrWCeWlhDVlmgSMW2NcMhM9lTStJjQlrUPtXIXA=;
 b=eopDrfIHJM8IF7mRG8hA1fo2Z2Wv/QglL0DtGpj2qBJXnvOnh1uFoTbEHVqbkZr0hi
 1O2KEk/Z9GSg59UhdSmK3b5z3iVSpalv+n1BwIci6d50WLLJInpEBSGAw4ky71skcvD3
 /b3NE+1mQei8LSfhnv+8SaHZvIbv7uB50EyBNoO8jdsEisPSiaNB0on7Qtwfa6I2YuiZ
 GCbv4e0aOQZctw6zlpkceuWHL3kV8Yso/gqdhaZRhoFUH8r3QRigsVls1uRN5+AABNuZ
 wnVVqB0tjHY354zrffCBXnjwbQ3PE3ULsXel0OiEr4U8q824qwvFh3Ssnth61pUZV7CM
 z9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Q7sKJrWCeWlhDVlmgSMW2NcMhM9lTStJjQlrUPtXIXA=;
 b=0HxRgULiXe7D/T0rPFXDQpu0UnVAUlxy+i2xITv4lxItYJzu+B+avQXpaiL2P02Uae
 LHqr8Ka3r9l/7EKVqf2Th9nejF2JC68pyleAxqQ/g2CW/ZLOSzQIxCcpePdD6BWGcTDu
 xs26OSP/Cf5j+/eEpKNaMLC4CCb4guin/Jw4nYE1OzxJQThg56K+4zL4ppGPNcuReCqc
 MykyYWs3sCsQAH0cS/pmidJBCV621e7E9qqmSFHABjW8R0RFY9Lmv6m9QifT1YkcfiGa
 SnAqTE20i4iWRMbjVx7OsVDtygV+VaTn9Z9YZ32gg/7p7iXq5YngH1EUGf82SBwHVkJa
 88UQ==
X-Gm-Message-State: AOAM533ZclPY9e6LQUjlDbIE/Eqs9hOe1+X+tMI8loJ6VDHRxty3mNr4
 i/WegF2KQoRpHOezCcuZZMxY1g==
X-Google-Smtp-Source: ABdhPJxRatrP6XqsNDLEYgx/Gmo8kTof4rjho1S2HneKMFITFunNGJP1JxO1h65VIohlIXxM0NUT5A==
X-Received: by 2002:a7b:cb4b:0:b0:397:3dd8:917a with SMTP id
 v11-20020a7bcb4b000000b003973dd8917amr10399106wmj.20.1653516456713; 
 Wed, 25 May 2022 15:07:36 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141]) by smtp.gmail.com with ESMTPSA id
 c15-20020a056000184f00b0020feb9c44c2sm95151wri.20.2022.05.25.15.07.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 May 2022 15:07:36 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220525145056.953631743a4c494aabf000dc@linux-foundation.org>
Date: Wed, 25 May 2022 23:07:35 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <F0E25DFF-8256-48FF-8B88-C0E3730A3E5E@jrtc27.com>
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
 <20220525145056.953631743a4c494aabf000dc@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Mailman-Approved-At: Fri, 27 May 2022 17:28:30 +0200
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 kvm@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parport@lists.infradead.org
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

On 25 May 2022, at 22:50, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Thu, 26 May 2022 05:35:20 +0800 kernel test robot <lkp@intel.com> =
wrote:
>=20
>> tree/branch: =
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git =
master
>> branch HEAD: 8cb8311e95e3bb58bd84d6350365f14a718faa6d  Add linux-next =
specific files for 20220525
>>=20
>> Error/Warning reports:
>>=20
>> ...
>>=20
>> Unverified Error/Warning (likely false positive, please contact us if =
interested):
>=20
> Could be so.
>=20
>> mm/shmem.c:1948 shmem_getpage_gfp() warn: should '(((1) << 12) / 512) =
<< folio_order(folio)' be a 64 bit type?
>=20
> I've been seeing this one for a while.  And from this report I can't
> figure out what tool emitted it.  Clang?
>=20
>>=20
>> ...
>>=20
>> |-- i386-randconfig-m021
>> |   `-- =
mm-shmem.c-shmem_getpage_gfp()-warn:should-((()-)-)-folio_order(folio)-be-=
a-bit-type
>=20
> If you're going to use randconfig then shouldn't you make the config
> available?  Or maybe quote the KCONFIG_SEED - presumably there's a way
> for others to regenerate.
>=20
> Anyway, the warning seems wrong to me.
>=20
>=20
> #define PAGE_SIZE               (_AC(1,UL) << PAGE_SHIFT)
>=20
> #define BLOCKS_PER_PAGE  (PAGE_SIZE/512)
>=20
> 	inode->i_blocks +=3D BLOCKS_PER_PAGE << folio_order(folio);
>=20
> so the RHS here should have unsigned long type.  Being able to =
generate
> the cpp output would be helpful.  That requires the .config.

This is i386, so an unsigned long is 32-bit, but i_blocks is a blkcnt_t
i.e. a u64, which makes the shift without a cast of the LHS fishy.

Jess

