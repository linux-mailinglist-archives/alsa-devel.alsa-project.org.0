Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D211F7BEE
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 19:01:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FD2C167C;
	Fri, 12 Jun 2020 19:01:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FD2C167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591981312;
	bh=edDxPbM6qpnGEX0lDWdQoAV3ME+KK5mJ83/hzjXgPVQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FfvwDN4i+bV8DjnUfd6Y5wYqu212cyr3Mvo1IC2TMigaesSqCAYiNG5C2JWVC6D6N
	 i1miXuWbMH2E3R3v7ERxNaID+Wwi60LhPj4iyLh4Xd6/OAPpVlQjpzXMOShpblEtNo
	 8ihLblsniVMZulgKv6xU4Ar/ndtQXeNXvCHXNrGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6285F8021E;
	Fri, 12 Jun 2020 19:00:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64F21F8021C; Fri, 12 Jun 2020 19:00:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C974F80058
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 19:00:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C974F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WomUm9Ox"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7930420801;
 Fri, 12 Jun 2020 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591981200;
 bh=edDxPbM6qpnGEX0lDWdQoAV3ME+KK5mJ83/hzjXgPVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WomUm9OxwOSvpYFJV8FMPoSPc0mtzOVsSTjFOkttg7XqBCLwhaCw30DlJqJUGl6OJ
 brZZFx0X8co8e/ua855fpd2WS6PONygrrfgzLS0spNL1LrBMo+m1U/foFor9PJxTew
 56OITza+QlfG/Ik5cFtEYqnURPwUhRFXLePvKZiI=
Date: Fri, 12 Jun 2020 17:59:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Phil Burk <philburk@google.com>
Subject: Re: [PATCH 0/2 v4] ALSA: pcm: anonymous dup implementation
Message-ID: <20200612165957.GP5396@sirena.org.uk>
References: <20190204093910.23878-1-perex@perex.cz>
 <20190326140928.GC10898@sirena.org.uk>
 <s5hva0567vs.wl-tiwai@suse.de>
 <CACL=Q7we61BwO81W7tQFvb9ohkBZkk34DSXL2B-Ky2B6zfWk1A@mail.gmail.com>
 <f5b429c6-803c-b624-6d39-5001c76e892f@perex.cz>
 <s5hd0lcppbn.wl-tiwai@suse.de>
 <CACL=Q7xSpeqyQzDyexCr+Nxs+nf3o9doaHGxiu-y8biK9w_9YQ@mail.gmail.com>
 <20200608134546.GG4593@sirena.org.uk>
 <CACL=Q7x43Udp_KA0C-N4+vcQ1MZ4NQt_xvf-nn6fRERRuz1tRg@mail.gmail.com>
 <CACL=Q7z_B3vSd_KOpUq_BdpuhJSDifs+koDAkcBY=hHnsVv=Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RCJLo13VlymhPcEi"
Content-Disposition: inline
In-Reply-To: <CACL=Q7z_B3vSd_KOpUq_BdpuhJSDifs+koDAkcBY=hHnsVv=Qw@mail.gmail.com>
X-Cookie: As seen on TV.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>, Leo Yan <leo.yan@linaro.org>,
 Baolin Wang <baolin.wang@linaro.org>
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


--RCJLo13VlymhPcEi
Content-Type: multipart/mixed; boundary="24/piotZLKF/SXqU"
Content-Disposition: inline


--24/piotZLKF/SXqU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2020 at 04:10:15PM -0700, Phil Burk wrote:

> https://www.alsa-project.org/pipermail/alsa-devel/2019-January/144925.html
> https://www.alsa-project.org/pipermail/alsa-devel/2019-January/144924.html

> It is hard for me to extract the relevant patches from those emails.

I've attached them in mbox format (b4 is a great tool for extracting
stuff from the archives on lore.kernel.org BTW:

   https://pypi.org/project/b4/

).  They seem to apply cleanly with git am -3 for me so should be easy
enough to apply to your tree hopefully.

> I would love to finish this project but I am not sure how. It seems we need
> to:

> 1) Evaluate the patches that Baolin suggests as a simpler alternative.

> 2) Test them in an Android kernel with AAudio MMAP.

> If you can provide a clear description of the latest set of patches then
> maybe I can work with someone in-house to test this.

I agree that that's the best approach - hopefully the mbox helps with
getting the patches onto a relevant tree, let me know if you still have
trouble.

For reference it's the patches from Jaroslav in this thread we're on
here, which can also be found here:

   https://lore.kernel.org/alsa-devel/20190204093910.23878-1-perex@perex.cz/

--24/piotZLKF/SXqU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="20190204093910.23878-2-perex@perex.cz.t.mbx-thread"
Content-Transfer-Encoding: quoted-printable

=46rom mboxrd@z Thu Jan  1 00:00:00 1970
=46rom: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/2] ALSA: pcm: implement the anonymous dup
	(inode file descriptor)
Date: Mon,  4 Feb 2019 10:39:09 +0100
Message-ID: <20190204093910.23878-2-perex@perex.cz>
References: <20190204093910.23878-1-perex@perex.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=3D"us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 by alsa0.perex.cz (Postfix) with ESMTP id 2873D267549
 for <alsa-devel@alsa-project.org>; Mon,  4 Feb 2019 10:39:54 +0100 (CET)
In-Reply-To: <20190204093910.23878-1-perex@perex.cz>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-dev=
el>,
 <mailto:alsa-devel-request@alsa-project.org?subject=3Dunsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=3Dhelp>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-deve=
l>,
 <mailto:alsa-devel-request@alsa-project.org?subject=3Dsubscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: ALSA development <alsa-devel@alsa-project.org>
Cc: Baolin Wang <baolin.wang@linaro.org>, Takashi Iwai <tiwai@suse.de>, Phi=
l Burk <philburk@google.com>, Zach Riggle <riggle@google.com>, Mark Brown <=
broonie@kernel.org>, Leo Yan <leo.yan@linaro.org>
List-Id: alsa-devel@alsa-project.org
Archived-At: <https://lore.kernel.org/alsa-devel/20190204093910.23878-2-per=
ex@perex.cz/>
List-Archive: <https://lore.kernel.org/alsa-devel/>

This patch implements new SNDRV_PCM_IOCTL_ANONYMOUS_DUP ioctl which
returns the new duplicated anonymous inode file descriptor
(anon_inode:snd-pcm) which can be passed to the restricted clients.

This patch is meant to be the alternative for the dma-buf interface. Both
implementation have some pros and cons:

anon_inode:dmabuf

- a bit standard export API for the DMA buffers
- fencing for the concurrent access [1]
- driver/kernel interface for the DMA buffer [1]
- multiple attach/detach scheme [1]

[1] the real usage for the sound PCM is unknown at the moment for this feat=
ure

anon_inode:snd-pcm

- simple (no problem with ref-counting, non-standard mmap implementation et=
c.)
- allow to use more sound interfaces for the file descriptor like status io=
ctls
- more fine grained security policies (another anon_inode name unshared with
  other drivers)

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h         |  8 +++---
 include/uapi/sound/asound.h |  3 +-
 sound/core/oss/pcm_oss.c    |  2 +-
 sound/core/pcm.c            | 13 ++++-----
 sound/core/pcm_compat.c     |  1 +
 sound/core/pcm_native.c     | 67 +++++++++++++++++++++++++++++++++++++++++=
----
 6 files changed, 75 insertions(+), 19 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index ca20f80f8976..b79ffaa0241d 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -579,11 +579,11 @@ static inline int snd_pcm_suspend_all(struct snd_pcm =
*pcm)
 }
 #endif
 int snd_pcm_kernel_ioctl(struct snd_pcm_substream *substream, unsigned int=
 cmd, void *arg);
-int snd_pcm_open_substream(struct snd_pcm *pcm, int stream, struct file *f=
ile,
-			   struct snd_pcm_substream **rsubstream);
+int snd_pcm_open_substream(struct snd_pcm *pcm, int stream, int subdevice,
+                           struct file *file, struct snd_pcm_substream **r=
substream);
 void snd_pcm_release_substream(struct snd_pcm_substream *substream);
-int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream, struct file =
*file,
-			     struct snd_pcm_substream **rsubstream);
+int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream, int subdevic=
e,
+			     struct file *file, struct snd_pcm_substream **rsubstream);
 void snd_pcm_detach_substream(struct snd_pcm_substream *substream);
 int snd_pcm_mmap_data(struct snd_pcm_substream *substream, struct file *fi=
le, struct vm_area_struct *area);
=20
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 404d4b9ffe76..ebc17d5a3490 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -153,7 +153,7 @@ struct snd_hwdep_dsp_image {
  *                                                                        =
   *
  *************************************************************************=
****/
=20
-#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 14)
+#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 15)
=20
 typedef unsigned long snd_pcm_uframes_t;
 typedef signed long snd_pcm_sframes_t;
@@ -576,6 +576,7 @@ enum {
 #define SNDRV_PCM_IOCTL_TSTAMP		_IOW('A', 0x02, int)
 #define SNDRV_PCM_IOCTL_TTSTAMP		_IOW('A', 0x03, int)
 #define SNDRV_PCM_IOCTL_USER_PVERSION	_IOW('A', 0x04, int)
+#define SNDRV_PCM_IOCTL_ANONYMOUS_DUP   _IOWR('A', 0x05, int)
 #define SNDRV_PCM_IOCTL_HW_REFINE	_IOWR('A', 0x10, struct snd_pcm_hw_param=
s)
 #define SNDRV_PCM_IOCTL_HW_PARAMS	_IOWR('A', 0x11, struct snd_pcm_hw_param=
s)
 #define SNDRV_PCM_IOCTL_HW_FREE		_IO('A', 0x12)
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index d5b0d7ba83c4..2ed609b65c45 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2420,7 +2420,7 @@ static int snd_pcm_oss_open_file(struct file *file,
 			if (! (f_mode & FMODE_READ))
 				continue;
 		}
-		err =3D snd_pcm_open_substream(pcm, idx, file, &substream);
+		err =3D snd_pcm_open_substream(pcm, idx, -1, file, &substream);
 		if (err < 0) {
 			snd_pcm_oss_release_file(pcm_oss_file);
 			return err;
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 4f45b3000347..af6f7fc3687b 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -918,15 +918,14 @@ static int snd_pcm_dev_free(struct snd_device *device)
 	return snd_pcm_free(pcm);
 }
=20
-int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
-			     struct file *file,
+int snd_pcm_attach_substream(struct snd_pcm *pcm,
+			     int stream, int subdevice, struct file *file,
 			     struct snd_pcm_substream **rsubstream)
 {
 	struct snd_pcm_str * pstr;
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_runtime *runtime;
 	struct snd_card *card;
-	int prefer_subdevice;
 	size_t size;
=20
 	if (snd_BUG_ON(!pcm || !rsubstream))
@@ -940,7 +939,6 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int s=
tream,
 		return -ENODEV;
=20
 	card =3D pcm->card;
-	prefer_subdevice =3D snd_ctl_get_preferred_subdevice(card, SND_CTL_SUBDEV=
_PCM);
=20
 	if (pcm->info_flags & SNDRV_PCM_INFO_HALF_DUPLEX) {
 		int opposite =3D !stream;
@@ -953,14 +951,14 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int=
 stream,
 	}
=20
 	if (file->f_flags & O_APPEND) {
-		if (prefer_subdevice < 0) {
+		if (subdevice < 0) {
 			if (pstr->substream_count > 1)
 				return -EINVAL; /* must be unique */
 			substream =3D pstr->substream;
 		} else {
 			for (substream =3D pstr->substream; substream;
 			     substream =3D substream->next)
-				if (substream->number =3D=3D prefer_subdevice)
+				if (substream->number =3D=3D subdevice)
 					break;
 		}
 		if (! substream)
@@ -974,8 +972,7 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int s=
tream,
=20
 	for (substream =3D pstr->substream; substream; substream =3D substream->n=
ext) {
 		if (!SUBSTREAM_BUSY(substream) &&
-		    (prefer_subdevice =3D=3D -1 ||
-		     substream->number =3D=3D prefer_subdevice))
+		    (subdevice =3D=3D -1 || substream->number =3D=3D subdevice))
 			break;
 	}
 	if (substream =3D=3D NULL)
diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 946ab080ac00..22446cd574ee 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -675,6 +675,7 @@ static long snd_pcm_ioctl_compat(struct file *file, uns=
igned int cmd, unsigned l
 	case SNDRV_PCM_IOCTL_TSTAMP:
 	case SNDRV_PCM_IOCTL_TTSTAMP:
 	case SNDRV_PCM_IOCTL_USER_PVERSION:
+	case SNDRV_PCM_IOCTL_ANONYMOUS_DUP:
 	case SNDRV_PCM_IOCTL_HWSYNC:
 	case SNDRV_PCM_IOCTL_PREPARE:
 	case SNDRV_PCM_IOCTL_RESET:
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 0bc4aa0ac9cf..bb14658e4482 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -37,6 +37,8 @@
 #include <sound/minors.h>
 #include <linux/uio.h>
 #include <linux/delay.h>
+#include <linux/anon_inodes.h>
+#include <linux/syscalls.h>
=20
 #include "pcm_local.h"
=20
@@ -2437,14 +2439,17 @@ void snd_pcm_release_substream(struct snd_pcm_subst=
ream *substream)
 }
 EXPORT_SYMBOL(snd_pcm_release_substream);
=20
-int snd_pcm_open_substream(struct snd_pcm *pcm, int stream,
+int snd_pcm_open_substream(struct snd_pcm *pcm, int stream, int subdevice,
 			   struct file *file,
 			   struct snd_pcm_substream **rsubstream)
 {
 	struct snd_pcm_substream *substream;
 	int err;
=20
-	err =3D snd_pcm_attach_substream(pcm, stream, file, &substream);
+	if (subdevice < 0 && pcm)
+		subdevice =3D snd_ctl_get_preferred_subdevice(pcm->card, SND_CTL_SUBDEV_=
PCM);
+
+	err =3D snd_pcm_attach_substream(pcm, stream, subdevice, file, &substream=
);
 	if (err < 0)
 		return err;
 	if (substream->ref_count > 1) {
@@ -2480,13 +2485,14 @@ EXPORT_SYMBOL(snd_pcm_open_substream);
=20
 static int snd_pcm_open_file(struct file *file,
 			     struct snd_pcm *pcm,
-			     int stream)
+			     int stream,
+			     int subdevice)
 {
 	struct snd_pcm_file *pcm_file;
 	struct snd_pcm_substream *substream;
 	int err;
=20
-	err =3D snd_pcm_open_substream(pcm, stream, file, &substream);
+	err =3D snd_pcm_open_substream(pcm, stream, subdevice, file, &substream);
 	if (err < 0)
 		return err;
=20
@@ -2551,7 +2557,7 @@ static int snd_pcm_open(struct file *file, struct snd=
_pcm *pcm, int stream)
 	add_wait_queue(&pcm->open_wait, &wait);
 	mutex_lock(&pcm->open_mutex);
 	while (1) {
-		err =3D snd_pcm_open_file(file, pcm, stream);
+		err =3D snd_pcm_open_file(file, pcm, stream, -1);
 		if (err >=3D 0)
 			break;
 		if (err =3D=3D -EAGAIN) {
@@ -2595,6 +2601,9 @@ static int snd_pcm_release(struct inode *inode, struc=
t file *file)
 	struct snd_pcm_file *pcm_file;
=20
 	pcm_file =3D file->private_data;
+	/* a problem in the anonymous dup can hit the NULL pcm_file */
+	if (pcm_file =3D=3D NULL)
+		return 0;
 	substream =3D pcm_file->substream;
 	if (snd_BUG_ON(!substream))
 		return -ENXIO;
@@ -2878,6 +2887,52 @@ static int snd_pcm_forward_ioctl(struct snd_pcm_subs=
tream *substream,
 	return result < 0 ? result : 0;
 }
=20
+static int snd_pcm_anonymous_dup(struct file *file,
+				 struct snd_pcm_substream *substream,
+				 int __user *arg)
+{
+	int fd, err, perm, flags;
+	struct file *nfile;
+	struct snd_pcm *pcm =3D substream->pcm;
+
+	if (get_user(perm, arg))
+		return -EFAULT;
+	if (perm < 0)
+		return -EPERM;
+	flags =3D file->f_flags & (O_ACCMODE | O_NONBLOCK);
+	flags |=3D O_APPEND | O_CLOEXEC;
+	fd =3D get_unused_fd_flags(flags);
+	if (fd < 0)
+		return fd;
+	nfile =3D anon_inode_getfile("snd-pcm", file->f_op, NULL, flags);
+	if (IS_ERR(nfile)) {
+		put_unused_fd(fd);
+		return PTR_ERR(nfile);
+	}
+	/* anon_inode_getfile() filters the O_APPEND flag out */
+	nfile->f_flags |=3D O_APPEND;
+	fd_install(fd, nfile);
+	if (!try_module_get(pcm->card->module)) {
+		err =3D -EFAULT;
+		goto __error1;
+	}
+	err =3D snd_card_file_add(pcm->card, nfile);
+	if (err < 0)
+		goto __error2;
+	err =3D snd_pcm_open_file(nfile, substream->pcm,
+				substream->stream, substream->number);
+	if (err >=3D 0) {
+		put_user(fd, arg);
+		return 0;
+	}
+	snd_card_file_remove(pcm->card, nfile);
+      __error2:
+	module_put(pcm->card->module);
+      __error1:
+	ksys_close(fd);
+	return err;
+}
+
 static int snd_pcm_common_ioctl(struct file *file,
 				 struct snd_pcm_substream *substream,
 				 unsigned int cmd, void __user *arg)
@@ -2906,6 +2961,8 @@ static int snd_pcm_common_ioctl(struct file *file,
 			     (unsigned int __user *)arg))
 			return -EFAULT;
 		return 0;
+	case SNDRV_PCM_IOCTL_ANONYMOUS_DUP:
+		return snd_pcm_anonymous_dup(file, substream, (int __user *)arg);
 	case SNDRV_PCM_IOCTL_HW_REFINE:
 		return snd_pcm_hw_refine_user(substream, arg);
 	case SNDRV_PCM_IOCTL_HW_PARAMS:
--=20
2.13.6

=46rom mboxrd@z Thu Jan  1 00:00:00 1970
=46rom: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/2] ALSA: pcm: implement the mmap buffer mode
	for the anonymous dup
Date: Mon,  4 Feb 2019 10:39:10 +0100
Message-ID: <20190204093910.23878-3-perex@perex.cz>
References: <20190204093910.23878-1-perex@perex.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=3D"us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 by alsa0.perex.cz (Postfix) with ESMTP id 59FCD267549
 for <alsa-devel@alsa-project.org>; Mon,  4 Feb 2019 10:40:02 +0100 (CET)
In-Reply-To: <20190204093910.23878-1-perex@perex.cz>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-dev=
el>,
 <mailto:alsa-devel-request@alsa-project.org?subject=3Dunsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=3Dhelp>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-deve=
l>,
 <mailto:alsa-devel-request@alsa-project.org?subject=3Dsubscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: ALSA development <alsa-devel@alsa-project.org>
Cc: Baolin Wang <baolin.wang@linaro.org>, Takashi Iwai <tiwai@suse.de>, Phi=
l Burk <philburk@google.com>, Zach Riggle <riggle@google.com>, Mark Brown <=
broonie@kernel.org>, Leo Yan <leo.yan@linaro.org>
List-Id: alsa-devel@alsa-project.org
Archived-At: <https://lore.kernel.org/alsa-devel/20190204093910.23878-3-per=
ex@perex.cz/>
List-Archive: <https://lore.kernel.org/alsa-devel/>

Android requires to allow the passing an anonymous inode file descriptor
with the restricted functionality - only the mmap operation for the DMA
sound buffer (anon_inode:snd-pcm-buffer). Android uses this access mode
for the direct EXCLUSIVE sound device access by applications.

This requirement is for the proper SELinux audit.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 include/sound/pcm.h         |  2 ++
 include/uapi/sound/asound.h |  3 +++
 sound/core/pcm_native.c     | 36 +++++++++++++++++++++++++++++++++---
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index b79ffaa0241d..55b95476d15e 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -227,6 +227,7 @@ struct snd_pcm_ops {
 struct snd_pcm_file {
 	struct snd_pcm_substream *substream;
 	int no_compat_mmap;
+	unsigned int perm;		/* file descriptor permissions */
 	unsigned int user_pversion;	/* supported protocol version */
 };
=20
@@ -537,6 +538,7 @@ struct snd_pcm {
  *  Registering
  */
=20
+extern const struct file_operations snd_pcm_f_op_buffer;
 extern const struct file_operations snd_pcm_f_ops[2];
=20
 int snd_pcm_new(struct snd_card *card, const char *id, int device,
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index ebc17d5a3490..b0270d07cf4e 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -571,6 +571,9 @@ enum {
 #define SNDRV_CHMAP_PHASE_INVERSE	(0x01 << 16)
 #define SNDRV_CHMAP_DRIVER_SPEC		(0x02 << 16)
=20
+#define SNDRV_PCM_PERM_MODE_FULL 	0	/* full access - no restrictions */
+#define SNDRV_PCM_PERM_MODE_BUFFER	1	/* allow to export only sound buffer =
through mmap */
+
 #define SNDRV_PCM_IOCTL_PVERSION	_IOR('A', 0x00, int)
 #define SNDRV_PCM_IOCTL_INFO		_IOR('A', 0x01, struct snd_pcm_info)
 #define SNDRV_PCM_IOCTL_TSTAMP		_IOW('A', 0x02, int)
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index bb14658e4482..7a21a2335a8d 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2502,6 +2502,7 @@ static int snd_pcm_open_file(struct file *file,
 		return -ENOMEM;
 	}
 	pcm_file->substream =3D substream;
+	pcm_file->perm =3D 0;
 	if (substream->ref_count =3D=3D 1)
 		substream->pcm_release =3D pcm_release_private;
 	file->private_data =3D pcm_file;
@@ -2894,17 +2895,30 @@ static int snd_pcm_anonymous_dup(struct file *file,
 	int fd, err, perm, flags;
 	struct file *nfile;
 	struct snd_pcm *pcm =3D substream->pcm;
+	struct snd_pcm_file *pcm_file;
+	const char *aname;
+	const struct file_operations *f_op;
=20
 	if (get_user(perm, arg))
 		return -EFAULT;
-	if (perm < 0)
-		return -EPERM;
+	switch (perm) {
+	case SNDRV_PCM_PERM_MODE_FULL:
+		aname =3D "snd-pcm";
+		f_op =3D file->f_op;
+		break;
+	case SNDRV_PCM_PERM_MODE_BUFFER:
+		aname =3D "snd-pcm-buf";
+		f_op =3D &snd_pcm_f_op_buffer;
+		break;
+	default:
+		return -EINVAL;
+	}
 	flags =3D file->f_flags & (O_ACCMODE | O_NONBLOCK);
 	flags |=3D O_APPEND | O_CLOEXEC;
 	fd =3D get_unused_fd_flags(flags);
 	if (fd < 0)
 		return fd;
-	nfile =3D anon_inode_getfile("snd-pcm", file->f_op, NULL, flags);
+	nfile =3D anon_inode_getfile(aname, f_op, NULL, flags);
 	if (IS_ERR(nfile)) {
 		put_unused_fd(fd);
 		return PTR_ERR(nfile);
@@ -2922,6 +2936,8 @@ static int snd_pcm_anonymous_dup(struct file *file,
 	err =3D snd_pcm_open_file(nfile, substream->pcm,
 				substream->stream, substream->number);
 	if (err >=3D 0) {
+		pcm_file =3D nfile->private_data;
+		pcm_file->perm =3D perm;
 		put_user(fd, arg);
 		return 0;
 	}
@@ -3295,6 +3311,9 @@ static int snd_pcm_mmap_status(struct snd_pcm_substre=
am *substream, struct file
 			       struct vm_area_struct *area)
 {
 	long size;
+	struct snd_pcm_file *pcm_file =3D file->private_data;
+	if (pcm_file->perm !=3D SNDRV_PCM_PERM_MODE_FULL)
+		return -EPERM;
 	if (!(area->vm_flags & VM_READ))
 		return -EINVAL;
 	size =3D area->vm_end - area->vm_start;
@@ -3331,6 +3350,9 @@ static int snd_pcm_mmap_control(struct snd_pcm_substr=
eam *substream, struct file
 				struct vm_area_struct *area)
 {
 	long size;
+	struct snd_pcm_file *pcm_file =3D file->private_data;
+	if (pcm_file->perm !=3D SNDRV_PCM_PERM_MODE_FULL)
+		return -EPERM;
 	if (!(area->vm_flags & VM_READ))
 		return -EINVAL;
 	size =3D area->vm_end - area->vm_start;
@@ -3738,6 +3760,14 @@ static unsigned long snd_pcm_get_unmapped_area(struc=
t file *file,
  *  Register section
  */
=20
+const struct file_operations snd_pcm_f_op_buffer =3D {
+	.owner =3D		THIS_MODULE,
+	.release =3D		snd_pcm_release,
+	.llseek =3D		no_llseek,
+	.mmap =3D			snd_pcm_mmap,
+	.get_unmapped_area =3D	snd_pcm_get_unmapped_area
+};
+
 const struct file_operations snd_pcm_f_ops[2] =3D {
 	{
 		.owner =3D		THIS_MODULE,
--=20
2.13.6


--24/piotZLKF/SXqU--

--RCJLo13VlymhPcEi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7jtIwACgkQJNaLcl1U
h9C3bgf9FJTclwXIHOb4khguChFQQcbz7J9TVOFTr2Gi3bKlVCMBNtbE+WJZ0Lyp
+cgzCb3NgPv3mJGCzylhFViv1a14LYuufHoY9W4E22mAwzoN8ap8pFP2DJBZwGRv
JYnsNpatiGOhpvFWY0/vqBRvHi7FHweuRA1hdsxSLHC9WkPHcWXtjzxEys7qNxH8
fWMwBwVfUiv9pkgXLHuog0D0liwpbMEpz7ambpVj4MTFENNoIC0XoQRDiUhg6yfh
YCw5ukEYKABRFlr+8ML/lOIV3qHQx70p2y5eEuttkpKFVRdvgQitM8SEE5ksnvY3
98VZTp6goAp0fczVhY/eL35l6NGSBg==
=mCcf
-----END PGP SIGNATURE-----

--RCJLo13VlymhPcEi--
