Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FF543383A
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 16:17:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CE3116AC;
	Tue, 19 Oct 2021 16:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CE3116AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634653074;
	bh=kb90i4DSCROHIXovzuBPSo1dKhKqfH5rynog4lYTR4A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i1yTQiOFOLSWHiNtqJ65GHAh3IUnGmRIAX5fP95drmcUUnHLm6eKa1P2Sfmwj9En1
	 O4Nu+YFN3bwCS+jJSbQSHrErmFzrYLI+alNT+MakonXOdpwRxxJyTwxvGSydtOiAC5
	 X5OluFcz90KsA+Qy/KcuHZjmCHiI/ZVKoHEbAI0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14A1EF80155;
	Tue, 19 Oct 2021 16:16:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ADDEF80111; Tue, 19 Oct 2021 16:16:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5453EF80111
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 16:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5453EF80111
Date: Tue, 19 Oct 2021 10:16:24 -0400
From: Rich Felker <dalias@libc.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [musl] Re: [alsa-devel] [PATCH v7 8/9] ALSA: add new 32-bit
 layout for snd_pcm_mmap_status/control
Message-ID: <20211019141622.GN7074@brightrain.aerifal.cx>
References: <s5h5yu79aab.wl-tiwai@suse.de>
 <CAK8P3a0qxNLv3_RcR5COcRGPcTnYMcfbOjdWKiT2hKdcof9WUg@mail.gmail.com>
 <s5hv9277oux.wl-tiwai@suse.de>
 <20211008120736.GF7074@brightrain.aerifal.cx>
 <s5hsfx95n99.wl-tiwai@suse.de>
 <20211018144259.GK7074@brightrain.aerifal.cx>
 <s5hlf2q4byc.wl-tiwai@suse.de>
 <20211018150824.GL7074@brightrain.aerifal.cx>
 <CAK8P3a1RAk5WRtMjqV6QZ1eHtFu_sxhSBJn0Uv-MhRA5WGiJqQ@mail.gmail.com>
 <20211018204203.GM7074@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline
In-Reply-To: <20211018204203.GM7074@brightrain.aerifal.cx>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Baolin Wang <baolin.wang@linaro.org>, Takashi Iwai <tiwai@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 musl@lists.openwall.com, Takashi Iwai <tiwai@suse.com>,
 Michael Forney <mforney@mforney.org>,
 y2038 Mailman List <y2038@lists.linaro.org>, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>
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


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 18, 2021 at 04:42:04PM -0400, Rich Felker wrote:
> On Mon, Oct 18, 2021 at 05:26:35PM +0200, Arnd Bergmann wrote:
> > On Mon, Oct 18, 2021 at 5:08 PM Rich Felker <dalias@libc.org> wrote:
> > > On Mon, Oct 18, 2021 at 04:58:03PM +0200, Takashi Iwai wrote:
> > > > On Mon, 18 Oct 2021 16:43:00 +0200, Rich Felker wrote:
> > >
> > > No, I don't think so. The musl translator is to translate between the
> > > time64 ioctl structures and the old time32 ones for the sake of
> > > executing on an old kernel. Up til now, it has been broken comparably
> > > to how 32-bit binaries running in compat mode on a 64-bit kernel were
> > > broken: the code in musl translated the time64 structure to (and back
> > > from) the time32 one assuming the intended padding. But the
> > > application was using the actual kernel uapi struct where the padding
> > > was (and still is) illogical. Thus, nothing was built with the wrong
> > > ABI; it's only the musl-internal translation logic that was wrong (and
> > > only pre-time64 kernels are affected).
> > >
> > > The attached patch should fix it, I think.
> > >
> > > + int adj = BYTE_ORDER==BIG_ENDIAN ? 4 : 0;
> > > + if (dir==W) {
> > > +     memcpy(old+68, new+72+adj, 4);
> > > +     memcpy(old+72, new+72+4+2*adj, 4);
> > 
> > I think that should be "new+72+4+3*adj": the "2*adj" would
> > be what the code does already for the originally intended
> > format.
> 
> Well for little endian either would work (because adj is 0 :) but yes
> there are 3 such paddings before the second member on big endian, so
> it should be 3.

How about this? It avoids open coding the logic and handles it as 2
4-byte substructures with endian-specific offsets.

Rich

--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="snd_pcm_mmap_control_v2.diff"

diff --git a/src/misc/ioctl.c b/src/misc/ioctl.c
index 49282811..35804f02 100644
--- a/src/misc/ioctl.c
+++ b/src/misc/ioctl.c
@@ -6,6 +6,7 @@
 #include <stddef.h>
 #include <stdint.h>
 #include <string.h>
+#include <endian.h>
 #include "syscall.h"
 
 #define alignof(t) offsetof(struct { char c; t x; }, x)
@@ -53,7 +54,7 @@ static const struct ioctl_compat_map compat_map[] = {
 	{ _IOWR('A', 0x23, char[136]), _IOWR('A', 0x23, char[132]), 0, WR, 1, 0 },
 	{ 0, 0, 4, WR, 1, 0 }, /* snd_pcm_sync_ptr (flags only) */
 	{ 0, 0, 32, WR, 1, OFFS(8,12,16,24,28) }, /* snd_pcm_mmap_status */
-	{ 0, 0, 8, WR, 1, OFFS(0,4) }, /* snd_pcm_mmap_control */
+	{ 0, 0, 4, WR, 1, 0 }, /* snd_pcm_mmap_control (each member) */
 
 	/* VIDIOC_QUERYBUF, VIDIOC_QBUF, VIDIOC_DQBUF, VIDIOC_PREPARE_BUF */
 	{ _IOWR('V',  9, new_misaligned(68)), _IOWR('V',  9, char[68]), 68, WR, 1, OFFS(20, 24) },
@@ -90,7 +91,11 @@ static void convert_ioctl_struct(const struct ioctl_compat_map *map, char *old,
 		 * if another exception appears this needs changing. */
 		convert_ioctl_struct(map+1, old, new, dir);
 		convert_ioctl_struct(map+2, old+4, new+8, dir);
-		convert_ioctl_struct(map+3, old+68, new+72, dir);
+		/* snd_pcm_mmap_control, special-cased due to kernel
+		 * type definition having been botched. */
+		int adj = BYTE_ORDER==BIG_ENDIAN ? 4 : 0;
+		convert_ioctl_struct(map+3, old+68, new+72+adj, dir);
+		convert_ioctl_struct(map+3, old+72, new+76+3*adj, dir);
 		return;
 	}
 	for (int i=0; i < map->noffs; i++) {

--0ntfKIWw70PvrIHh--
