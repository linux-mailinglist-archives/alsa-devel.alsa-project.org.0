Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF3193A0F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 08:59:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54B3F1673;
	Thu, 26 Mar 2020 08:58:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54B3F1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585209584;
	bh=jhwV2bUf2vv1GAxX5OuzEMFBnO+PZtC9bX/OHQXxTv4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QZ3xoMOMFLrYylNiuO2x0CWqOX9aF1ZliBxunJVqFZ272ixeayAFTE2Oz/q5ebtPr
	 nd70zDbgbx8VI+e0H6gh1TCxujU5HRB3RA0TwOiVesbBQZZq14bHSBoY9j5pGNu5J1
	 Hf2YDIZaXMdvYlCruYaNLxq4+H1IxZ6ygkX8SFbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05D14F802BC;
	Thu, 26 Mar 2020 08:54:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B6AEF801F9; Tue, 24 Mar 2020 19:58:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D49AEF80095
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 19:58:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D49AEF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de
 header.b="UbGUgZ69"
Received: from zn.tnic (p200300EC2F0BC80080B0BF5C4664F3C7.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:c800:80b0:bf5c:4664:f3c7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9A7121EC0CDC;
 Tue, 24 Mar 2020 19:58:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1585076322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=lIsYy50HXEV0jz9brVxw6K/8V+POkTYJ1qZEO3jtQOg=;
 b=UbGUgZ69w4Pss5KZcP0C5ESSPwJnCZ+xLrK8REFRMm8MOCwnwgNDcPNNugDTJ+7KIwZSFC
 e/kJWtYxyIsXtyDUQzsUBRadkW8G4F6hrSbBvbtrMmiWK9xxBgpLZNe84h3kMcq6J81FTB
 cG1Lotv4gFJ5JLaB6VJMHXCySgkcsMI=
Date: Tue, 24 Mar 2020 19:58:36 +0100
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 23/22] x86/smpboot: Remove the last ICPU() macro
Message-ID: <20200324185836.GI22931@zn.tnic>
References: <20200320131345.635023594@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200320131345.635023594@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 26 Mar 2020 08:54:37 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>, x86@kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Mark Gross <mgross@linux.intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
 Zhang Rui <rui.zhang@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 linux-pm@vger.kernel.org, linux-mmc@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Takashi Iwai <tiwai@suse.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 linux-crypto@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Andy Shevchenko <andy@infradead.org>
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

---
From: Borislav Petkov <bp@suse.de>

Now all is using the shiny new macros.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/smpboot.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index fe3ab9632f3b..3b9bf8c7e29d 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1849,24 +1849,25 @@ static bool slv_set_max_freq_ratio(u64 *base_freq, u64 *turbo_freq)
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 
-#define ICPU(model) \
-	{X86_VENDOR_INTEL, 6, model, X86_FEATURE_APERFMPERF, 0}
+#define X86_MATCH(model)					\
+	X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 6,		\
+		INTEL_FAM6_##model, X86_FEATURE_APERFMPERF, NULL)
 
 static const struct x86_cpu_id has_knl_turbo_ratio_limits[] = {
-	ICPU(INTEL_FAM6_XEON_PHI_KNL),
-	ICPU(INTEL_FAM6_XEON_PHI_KNM),
+	X86_MATCH(XEON_PHI_KNL),
+	X86_MATCH(XEON_PHI_KNM),
 	{}
 };
 
 static const struct x86_cpu_id has_skx_turbo_ratio_limits[] = {
-	ICPU(INTEL_FAM6_SKYLAKE_X),
+	X86_MATCH(SKYLAKE_X),
 	{}
 };
 
 static const struct x86_cpu_id has_glm_turbo_ratio_limits[] = {
-	ICPU(INTEL_FAM6_ATOM_GOLDMONT),
-	ICPU(INTEL_FAM6_ATOM_GOLDMONT_D),
-	ICPU(INTEL_FAM6_ATOM_GOLDMONT_PLUS),
+	X86_MATCH(ATOM_GOLDMONT),
+	X86_MATCH(ATOM_GOLDMONT_D),
+	X86_MATCH(ATOM_GOLDMONT_PLUS),
 	{}
 };
 
-- 
2.21.0


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
