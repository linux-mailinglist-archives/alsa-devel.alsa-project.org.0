Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1C367FD9A
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Jan 2023 09:24:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 819A4E95;
	Sun, 29 Jan 2023 09:24:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 819A4E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674980696;
	bh=Y432cQgFP5F34pSdT8J5cN2U4/Abh03N/7/nnZFsfgA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nzbRX2C4N2gKEB14RtrvN8Ikmfj1Qi/VCaqS8LXfPN90+o5LpSiRVF421JbW0rtmj
	 NZu44G5vUZy7B9Lfsv0+b8UrBBd2imXHNzWXjjhrMuqLUJ15IxItTKOjuu6HokQyo1
	 X0xQuucZS64aOoly/TFULwCnlEZ7qy1YmtzO0yis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 148E3F80543;
	Sun, 29 Jan 2023 09:23:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73ED9F80549; Sat, 28 Jan 2023 11:48:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37FD0F80542
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 11:48:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37FD0F80542
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ucQIwNrY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C648060B51;
 Sat, 28 Jan 2023 10:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F057DC433D2;
 Sat, 28 Jan 2023 10:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674902917;
 bh=Y432cQgFP5F34pSdT8J5cN2U4/Abh03N/7/nnZFsfgA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ucQIwNrYn1j82n5kEO9WaLijY1byLMow61bm47krLw9/rm4ppKVrlbLz6phB9zNbS
 qYY9lfErpOzRey8+JWhrlP2K20ge8aTXRGAB1RaAXSma5mb3gsVcM7JjsMlaYHRq6p
 5Sc6Wb+I4Y9+t6nEP7exbyKAI00PmKAmlmdPi+RpRtLkxQxgwEsoweOc60InbgtjXH
 FqvZ8MvQZkaZTFpjHfucUR24TwuTg8tFdRbslI7LaInKzs0Rwp3ur5+5MyfOIl4uaR
 6DEA3qekp8dP3oIUZTw+yBhAfVg6biPer6tOhWjPLMuQk2/uOpgUZPcQmhGK5/Sihz
 AcjSu+HZd6TdA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230127064005.1558-1-rdunlap@infradead.org>
References: <20230127064005.1558-1-rdunlap@infradead.org>
Subject: Re: (subset) [PATCH 00/35] Documentation: correct lots of spelling
 errors (series 1)
Message-Id: <167490289567.2145989.15703368734300500078.b4-ty@kernel.org>
Date: Sat, 28 Jan 2023 10:48:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-Mailman-Approved-At: Sun, 29 Jan 2023 09:23:11 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Juri Lelli <juri.lelli@redhat.com>,
 Henrik Rydberg <rydberg@bitmath.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, James Morris <jmorris@namei.org>,
 linux-acpi@vger.kernel.org, Len Brown <len.brown@intel.com>,
 linux-pm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-sgx@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-spi@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, alsa-devel@alsa-project.org,
 linux-doc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 keyrings@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, linux-trace-kernel@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-pci@vger.kernel.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Will Deacon <will@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, isdn4linux@listserv.isdn4linux.de,
 linux-input@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Jiri Kosina <jikos@kernel.org>,
 Akinobu Mita <akinobu.mita@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-crypto@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 linux-fbdev@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>, target-devel@vger.kernel.org,
 bpf@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
 Peter Zijlstra <peterz@infradead.org>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-trace-devel@vger.kernel.org,
 live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
 linux-leds@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>,
 linux-scsi@vger.kernel.org, Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Jonas Bonn <jonas@southpole.se>, Heiko Carstens <hca@linux.ibm.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-block@vger.kernel.org,
 =?utf-8?q?J=C3=A9r=C3=B4me_Glisse?= <jglisse@redhat.com>,
 openrisc@lists.librecores.org, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-security-module@vger.kernel.org,
 Daniel Bristot de Oliveira <bristot@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 26 Jan 2023 22:39:30 -0800, Randy Dunlap wrote:
> Correct many spelling errors in Documentation/ as reported by codespell.
> 
> Maintainers of specific kernel subsystems are only Cc-ed on their
> respective patches, not the entire series. [if all goes well]
> 
> These patches are based on linux-next-20230125.
> 
> [...]

Applied to

   broonie/spi.git for-next

Thanks!

[27/35] Documentation: spi: correct spelling
        commit: 0f6d2cee58f1ff2ebf66f0bceb113d79f66ecb07

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

