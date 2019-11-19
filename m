Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C110386D
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 12:15:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 645A716FE;
	Wed, 20 Nov 2019 12:15:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 645A716FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574248554;
	bh=JGc7gcsCGbgO4QY8iEGmpHmtqsFKoZoKSlhQYXJjM0E=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EmCIiFZFGQAT6CThpmJ4hNG+50VHKuivv9LIwvfg/pwauTsi4496lJ2Jpe67csK71
	 HZqc/t0Glxtaujaji5mKuNEC66uIRjefd3BLBhZWU5zbteJKwW9PmN1evy1fslX/ES
	 9FoNxuNeN5YA8ORihMoXRh6+FukKO5UeqC5fpluM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7184DF8027D;
	Wed, 20 Nov 2019 12:02:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB3CCF80137; Tue, 19 Nov 2019 13:01:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 44D4BF800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 13:00:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44D4BF800F4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8F8D30E;
 Tue, 19 Nov 2019 04:00:55 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37AE63F703;
 Tue, 19 Nov 2019 04:00:55 -0800 (PST)
Date: Tue, 19 Nov 2019 12:00:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Message-ID: <20191119120053.GA3634@sirena.org.uk>
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
 <20191119002121.4107-10-sean.j.christopherson@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191119002121.4107-10-sean.j.christopherson@intel.com>
X-Cookie: Beam me up, Scotty!  It ate my phaser!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 20 Nov 2019 12:02:18 +0100
Cc: Mark Rutland <mark.rutland@arm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Jie Yang <yang.jie@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Nadav Amit <namit@vmware.com>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Jiri Olsa <jolsa@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-acpi@vger.kernel.org, x86@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Darren Hart <dvhart@infradead.org>, Len Brown <len.brown@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Steven Rostedt <rostedt@goodmis.org>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, platform-driver-x86@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Takashi Iwai <tiwai@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
Subject: Re: [alsa-devel] [PATCH 09/12] ASoC: Intel: Skylake: Explicitly
 include linux/io.h for virt_to_phys()
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
Content-Type: multipart/mixed; boundary="===============3755115609098539957=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3755115609098539957==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2019 at 04:21:18PM -0800, Sean Christopherson wrote:
> Through a labyrinthian sequence of includes, usage of virt_to_phys() is
> dependent on the include of asm/io.h in x86's asm/realmode.h, which is
> included in x86's asm/acpi.h and thus by linux/acpi.h.  Explicitly
> include linux/io.h to break the dependency on realmode.h so that a
> future patch can remove the realmode.h include from acpi.h without
> breaking the build.

Acked-by: Mark Brown <broonie@kernel.org>

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3T2XIACgkQJNaLcl1U
h9Ag5gf8CXRFNxgU/ospZfWpWqo31BrJS3TLJbiQogFQrYt6MzUt/rehd+5DN1bH
rRAsHldAHpkPGu0ZDj4QRiH29Oc0G1xQAPyMbMnG3afcORJp9DkaBs8mLBd4Xh4r
S4bPP4Lr+GeOJepjK6LOz948KigmvpZVDzgGiwqaRZfxT36f92BS3dXnTUoe3Khx
q1z6+agCYbpIS9NtBzVBpuJ1b4opTj4/7G8POfaPbYyGxaI0Mr8mwkwMdwvtXz4V
04C5nyfw5qQmjWqpMQuolxXEPW7DvIpobAYnFHL/qrf5DzSd9Yc5bPUx3Y61swla
VoEhYM6CbdD6hpBeVhY8lbGgINd/1g==
=zPtj
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--

--===============3755115609098539957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3755115609098539957==--
