Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC3346F983
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 04:12:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A982120AE;
	Fri, 10 Dec 2021 04:11:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A982120AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639105946;
	bh=YAMO5BKbpw0kTGPEONiCkQszrzlt5l3k4t65i1KEzTA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pwwXt+SOon1FSVy4aFzzdUP72jAKaAhQsk1i1IJ3F1kFYALV1pX70JxepLQt/vmSl
	 L/t9s03tk6v+bwjEZLVF9j7C8fM06vrLmVMY4cVDmTnEnra6xiy/v3kzT4OnuoeBi6
	 T5XTwK/wQR6wdThttqcZdDz7YKajw0noXjMMJL6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 195CFF804E6;
	Fri, 10 Dec 2021 04:11:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38BEFF804E5; Fri, 10 Dec 2021 04:11:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6291DF800AB
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 04:11:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6291DF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ooi24r+c"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="hghuooHN"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 5D0253201D5E;
 Thu,  9 Dec 2021 22:10:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 09 Dec 2021 22:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=XvBxYVM3g9LEJ16HEsiPsG8sTmF
 KDAldsLmP7Fdpfv8=; b=ooi24r+cy51rf/LJUcjs7P3ugDgVI8817ePzJFV/ypd
 IMFJadQDt4UbeZvlX5o/732M2QRrn6dWW/RroAccjTOi4pbG+Ui3xXaea2MgCnPC
 VJW3aoVO3Jr6eEhUEbKIomjsZD4I2O5mRCtkJ4EEJLmbVoVSdilPLZ4vEm5yUqMW
 jmVYt5e+UxsQqj0wTUUMXZBeYBWQgrs0eBIHqFKe9DGXg6Qb2nHK8w70po+DWZGJ
 vpl8BmFjIkAUW61iYcnkTJ2aIHx9CxL0Pv1hSFw3SWolUgXZVX6i12gn2WIYy57i
 mPQrJn8xBc5jyKCynp+nJ8wClaLNb9OmferLOZB8xPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XvBxYV
 M3g9LEJ16HEsiPsG8sTmFKDAldsLmP7Fdpfv8=; b=hghuooHNqaLQM9O+vo4e3R
 iy8DdB0P5XHHocG5MdbdYwPw3FqFw1n/AHUuEJMNNGEsCItxh/rQKUdqf5HTq2ys
 d0UlY8ajYE0Oa4+mEehKj6Mir0KSBSwB82v6KPHRyaflj5eFjDbOg2a/D+Qt2S7z
 Wvvro2J/0b3pXZp4uD/WKKj2eljrgxmVLgmJdIHD84BZivNrfZb7c5ku6jdQhKZD
 zYCK/8a7oY7z2Hk75B9i5KtbnUfIyez86rZdXAuyGR/GOeaGwB+/N0b9xQofSAuz
 05WQHQZqc4XK+Ul6J1e8kdotmXkPsH1f0TIgqLCBRI5s0rLsNG49zRLhacvce4wg
 ==
X-ME-Sender: <xms:PMWyYRnztFSGlaXFq7BxuF7mke2fggRzQIBD_Haa_bX8mKpIuqt3EQ>
 <xme:PMWyYc0TdrScuSaW5X87FiMeSdk4myIHDO40oHgz-rVm7Ve3cfArpSIqikDAaS3jB
 Cf-IRJ8t_C81B2JrnE>
X-ME-Received: <xmr:PMWyYXr0bOr4Z0qjQwVvjv188W5_1ELZceIRG3iSNIugEk5miFnKxCIhsNLTlld46s4oc5pS1Pl2Ii-Fdjs-WZDnjLunyvLZUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkedugdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhepjeegieefueevueefieeggeejledvgfejgeffjefgvdek
 leehgfdtfeetjeelkeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:PMWyYRkgZSWEWEj19aQsvppdAtrQ7d_Dw6o3KZgwxa9RQotddIey1A>
 <xmx:PMWyYf3kNEhRG73EoTGopjK3Wb3xkc3wL4qfu1PIhD6Mm30Y1qnuZQ>
 <xmx:PMWyYQtqY0R6k4l4p2YxEc0VXlp3my2WJBHk26ZEQ9R4x3nzEiD2YQ>
 <xmx:PMWyYZpQmR73TI6qYQlnMHcOo8JY4X15wqU6wPHekCaB6Qu5dNutOA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Dec 2021 22:10:49 -0500 (EST)
Date: Fri, 10 Dec 2021 12:10:47 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 2/3] kselftest: alsa: optimization for
 SNDRV_CTL_ELEM_ACCESS_VOLATILE
Message-ID: <YbLFNx44I802GMcK@workstation>
Mail-Followup-To: Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Jaroslav Kysela <perex@perex.cz>, Shuah Khan <shuah@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org
References: <20211208211745.533603-1-broonie@kernel.org>
 <20211208211745.533603-3-broonie@kernel.org>
 <62df6074-6d22-2a4d-0191-369de56a2fe3@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62df6074-6d22-2a4d-0191-369de56a2fe3@linuxfoundation.org>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>
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

Dear Shuah Khan,

On Wed, Dec 08, 2021 at 02:25:36PM -0700, Shuah Khan wrote:
> On 12/8/21 2:17 PM, Mark Brown wrote:
> > From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > 
> > The volatile attribute of control element means that the hardware can
> > voluntarily change the state of control element independent of any
> > operation by software. ALSA control core necessarily sends notification
> > to userspace subscribers for any change from userspace application, while
> > it doesn't for the hardware's voluntary change.
> > 
> > This commit adds optimization for the attribute. Even if read value is
> > different from written value, the test reports success as long as the
> > target control element has the attribute. On the other hand, the
> > difference is itself reported for developers' convenience.
> > 
> > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > Link: https://lore.kernel.org/r/Ya7TAHdMe9i41bsC@workstation
> > Signed-off-by: Mark Brown <broonie@kernel.org>
> > ---
> >   tools/testing/selftests/alsa/mixer-test.c | 10 +++++++---
> >   1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
> > index ab51cf7b9e03..171d33692c7b 100644
> > --- a/tools/testing/selftests/alsa/mixer-test.c
> > +++ b/tools/testing/selftests/alsa/mixer-test.c
> > @@ -307,9 +307,13 @@ bool show_mismatch(struct ctl_data *ctl, int index,
> >   	}
> >   	if (expected_int != read_int) {
> > -		ksft_print_msg("%s.%d expected %lld but read %lld\n",
> > -			       ctl->name, index, expected_int, read_int);
> > -		return true;
> > +		// NOTE: The volatile attribute means that the hardware can voluntarily change the
> > +		// state of control element independent of any operation by software.
> 
> Let's stick to kernel comment format :)
> 
> > +		bool is_volatile = snd_ctl_elem_info_is_volatile(ctl->info);
> > +
> > +		ksft_print_msg("%s.%d expected %lld but read %lld, is_volatile %d\n",
> > +			       ctl->name, index, expected_int, read_int, is_volatile);
> > +		return !is_volatile;
> >   	} else {
> >   		return false;
> >   	}
> > 
> 
> With that change:
> 
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Thanks for your review. Indeed, when following to existent guideline of
coding style, the comment should follow to C89/C90 style. I have no
objection to your advice itself, while for the guideline itself I'd like
to ask your opinion (and your help if possible).


In section '8) Commenting' in 'Documentation/process/coding-style.rst',
we can see no example for comment prefixed with double slashes; '//'. On
the other hand, we can see tons of actual usage in whole tree. We have the
inconsistency between the guideline and what developers have done.

I think that the decision to allow double-slashes comment or not is left
to subsystem maintainers, while I know that it's not allowed in UAPI
header since they are built with --std=C90 compiler option (see head of
'usr/include/Makefile'). I can not find such restriction in the other
parts of kernel code.

In my reference book about C language, double-slashes comment was
officially introduced in C99 (ISO/IEC 9899:1999) therefore it's not
specific to C++ nowadays. It's merely out of specification called as
'standard C' or 'ANSI C' (C89/C90, ISO/IEC 9899:1990).


Linux Torvalds appeared as his acceptance of double-slashes comment in the
context about his intolerance of multi-line comment such that the
introduction of comment, '/*', is just followed by content of comment
without line break:

 * Re: [patch] crypto: sha256-mb - cleanup a || vs | typo
     * https://lore.kernel.org/lkml/CA+55aFyQYJerovMsSoSKS7PessZBr4vNp-3QUUwhqk4A4_jcbg@mail.gmail.com/

His preference is not necessarily equivalent to collective opinion in
kernel development community when seeing the patch applied later:

 * commit c4ff1b5f8bf0 ("CodingStyle: add networking specific block comment style")
     * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c4ff1b5f8bf0

His opinion does not necessarily have complete clout in the community,
but overall there is less reason to reject the double-slashes comment.


In my opinion, it's time to modify the coding style documentation in the
point of comment so that:

 * accept double-slashes comment from C99 in whole tree
 * except for UAPI header (to keep backward compatibility of userspace
   applications still built for C89/C90)

...But the discussion about official acceptance of C99 code can itself
evolve many developers since it's equivalent to loss of backward
compatibility to the environment built just for C89/C90. It's the reason I
never work for it since I have limited resources to join in the
discussion (I'm unpaid hobbyist with language barrier. My task in sound
subsystem is development and maintenance of in-kernel protocol
implementation of IEC 61883-1/6 and application drivers, including heavy
load for reverse engineering).

I'm glad if getting your assistance somehow for the issue.


Best regards

Takashi Sakamoto
