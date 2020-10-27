Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7432F29CEE7
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 09:14:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CD4C1698;
	Wed, 28 Oct 2020 09:13:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CD4C1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603872880;
	bh=ArOiFOnvKSqrsDxW3KSNc3CawPTSXXH7eWtmWRIrMx8=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KFZHiz+fcJgeAdzSxJHeyAcRzEv8JRFOojdPMT6tT5Go6pHS8Bh93+NTxNDkNkxTg
	 VvD2Vl8/+8I2cRSCmPQFPREEaoVUTBXU8xhVHVse+aIzytE9fAtpEHJeu+45pttLYb
	 7KnGgxD8ua+2z3OS+/vYcXXwJQLVAAnWiZtrNbOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F728F80551;
	Wed, 28 Oct 2020 09:07:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B839F8019D; Tue, 27 Oct 2020 17:50:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0107.hostedemail.com
 [216.40.44.107])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0ACAFF8019D
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 17:50:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ACAFF8019D
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 86139180A7FE0;
 Tue, 27 Oct 2020 16:50:43 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: bag02_2a11e012727d
X-Filterd-Recvd-Size: 4083
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Tue, 27 Oct 2020 16:50:38 +0000 (UTC)
Message-ID: <685d850347a1191bba8ba7766fc409b140d18f03.camel@perches.com>
Subject: Re: [PATCH 3/8] vhost: vringh: use krealloc_array()
From: Joe Perches <joe@perches.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 27 Oct 2020 09:50:36 -0700
In-Reply-To: <20201027112607-mutt-send-email-mst@kernel.org>
References: <20201027121725.24660-1-brgl@bgdev.pl>
 <20201027121725.24660-4-brgl@bgdev.pl>
 <20201027112607-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 28 Oct 2020 09:06:30 +0100
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo@padovan.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Christoph Lameter <cl@linux.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>,
 linux-media@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 linux-gpio@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, James Morse <james.morse@arm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
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

On Tue, 2020-10-27 at 11:28 -0400, Michael S. Tsirkin wrote:
> On Tue, Oct 27, 2020 at 01:17:20PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > 
> > Use the helper that checks for overflows internally instead of manually
> > calculating the size of the new array.
> > 
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> No problem with the patch, it does introduce some symmetry in the code.

Perhaps more symmetry by using kmemdup
---
 drivers/vhost/vringh.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index 8bd8b403f087..99222a3651cd 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -191,26 +191,23 @@ static int move_to_indirect(const struct vringh *vrh,
 static int resize_iovec(struct vringh_kiov *iov, gfp_t gfp)
 {
 	struct kvec *new;
-	unsigned int flag, new_num = (iov->max_num & ~VRINGH_IOV_ALLOCATED) * 2;
+	size_t new_num = (iov->max_num & ~VRINGH_IOV_ALLOCATED) * 2;
+	size_t size;
 
 	if (new_num < 8)
 		new_num = 8;
 
-	flag = (iov->max_num & VRINGH_IOV_ALLOCATED);
-	if (flag)
-		new = krealloc(iov->iov, new_num * sizeof(struct iovec), gfp);
-	else {
-		new = kmalloc_array(new_num, sizeof(struct iovec), gfp);
-		if (new) {
-			memcpy(new, iov->iov,
-			       iov->max_num * sizeof(struct iovec));
-			flag = VRINGH_IOV_ALLOCATED;
-		}
-	}
+	if (unlikely(check_mul_overflow(new_num, sizeof(struct iovec), &size)))
+		return -ENOMEM;
+
+	if (iov->max_num & VRINGH_IOV_ALLOCATED)
+		new = krealloc(iov->iov, size, gfp);
+	else
+		new = kmemdup(iov->iov, size, gfp);
 	if (!new)
 		return -ENOMEM;
 	iov->iov = new;
-	iov->max_num = (new_num | flag);
+	iov->max_num = new_num | VRINGH_IOV_ALLOCATED;
 	return 0;
 }
 
 

